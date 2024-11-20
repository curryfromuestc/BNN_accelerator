def txt_to_coe(txt_filename, coe_filename):
    with open(txt_filename, 'r') as txt_file:
        data = txt_file.read().strip().split()
    
    with open(coe_filename, 'w') as coe_file:
        coe_file.write("memory_initialization_radix=2;\n")
        coe_file.write("memory_initialization_vector=\n")
        
        for value in data[:-1]:
            coe_file.write(f"{value},\n")
        coe_file.write(f"{data[-1]};\n")

if __name__ == '__main__':
    txt_to_coe('/home/curry/code/curry_code_summay/rtl_works/BNN_on_fpga/test_fc1_weight_txt.txt', '/home/curry/code/curry_code_summay/rtl_works/BNN_on_fpga/fc.coe')