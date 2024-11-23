import re

# 定义要修改的文件和参数
file_path = 'conv.v'
parameters_to_update = {
    'K': 7,
    'S': 2
}

# 读取文件内容
with open(file_path, 'r') as file:
    content = file.read()

# 修改参数
for param, value in parameters_to_update.items():
    content = re.sub(rf'parameter\s+{param}\s*=\s*\d+', f'parameter {param} = {value}', content)

# 保存修改后的文件
with open(file_path, 'w') as file:
    file.write(content)

print(f"Updated parameters in {file_path}")