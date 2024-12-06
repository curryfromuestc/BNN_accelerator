import torch
import torch.nn as nn
import torch.nn.functional as F



def SigmoidGFunc(x, alpha=4.):   # 带参数Sigmoid函数的导数
    sigx = torch.sigmoid(alpha * x)
    return alpha * sigx * (1. - sigx)


def BinaryWBackFunc(x, alpha=4.):   # 权值量化反向梯度函数
    return 2 * SigmoidGFunc(x, alpha)


class BinaryWeight(torch.autograd.Function):
    @staticmethod
    def forward(ctx, input):
        ctx.save_for_backward(input)
        return torch.sign(input)

    @staticmethod
    def backward(ctx, grad_output):
        input, = ctx.saved_tensors
        return grad_output * BinaryWBackFunc(input, alpha=4.)


class BinaryActivation(nn.Module):
    def __init__(self):
        super(BinaryActivation, self).__init__()
        
    def forward(self, x):
        ba = BinaryWeight.apply(x)
        return ba


class BinaryLinear(nn.Linear):
    def __init__(self, in_features, out_features, bias=False):
        super(BinaryLinear, self).__init__(in_features, out_features, bias)
        
    def forward(self, x):

        w = self.weight
        # scaling_factor = torch.mean(abs(w),dim=1,keepdim=True)
        scaling_factor = torch.mean(torch.mean(abs(w),dim=1,keepdim=True),dim=0,keepdim=True)
        scaling_factor = scaling_factor.detach()
        bw = scaling_factor * BinaryWeight.apply(w)
        
        return F.linear(x, bw, self.bias)


class BinaryConv1d(nn.Conv1d):
    def __init__(self, in_channels, out_channels, kernel_size, stride=1,
                 padding=0, dilation=1, groups=1, bias=False):
        super(BinaryConv1d, self).__init__(in_channels, out_channels, 
            kernel_size, stride, padding, dilation, groups, bias)
        
    def forward(self, x):
        
        w = self.weight
        # scaling_factor = torch.mean(torch.mean(abs(w),dim=2,keepdim=True),dim=1,keepdim=True)
        scaling_factor = torch.mean(torch.mean(torch.mean(abs(w),dim=2,keepdim=True),dim=1,keepdim=True),dim=0,keepdim=True)
        scaling_factor = scaling_factor.detach()
        bw = scaling_factor * BinaryWeight.apply(w)
    
        return F.conv1d(x, bw, self.bias, self.stride,
                    self.padding, self.dilation, self.groups)


class BinaryConv2d(nn.Conv2d):
    def __init__(self, in_channels, out_channels, kernel_size, stride=1,
                 padding=0, dilation=1, groups=1, bias=False):
        super(BinaryConv2d, self).__init__(in_channels, out_channels, 
            kernel_size, stride, padding, dilation, groups, bias)
        
    def forward(self, x):
        
        w = self.weight
        # scaling_factor = torch.mean(torch.mean(torch.mean(abs(w),dim=3,keepdim=True),dim=2,keepdim=True),dim=1,keepdim=True)
        scaling_factor = torch.mean(torch.mean(torch.mean(torch.mean(abs(w),dim=3,keepdim=True),dim=2,keepdim=True),dim=1,keepdim=True),dim=0,keepdim=True)
        scaling_factor = scaling_factor.detach()
        bw = scaling_factor * BinaryWeight.apply(w)
    
        return F.conv2d(x, bw, self.bias, self.stride,
                    self.padding, self.dilation, self.groups)