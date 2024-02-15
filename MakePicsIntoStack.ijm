// 定义文件夹路径
folder = "C:/Users/15835/Desktop/Biophysics Lab/randomball3/";

// 获取文件夹中的所有文件
list = getFileList(folder);

// 建立一个空的图像列表
images = newArray(list.length);

// 遍历文件夹中的所有文件
for (i = 0; i < list.length; i++) {
    // 检查文件是否是以"particle_motion_"开头并且以".tiff"结尾
    file_name = list[i];
    if (endsWith(file_name, ".tiff")) {
        file_prefix = "particle_motion_";
        file_suffix = "_chaotic.tiff";
        // 获取文件名中的数字
        start_index = indexOf(file_name, file_prefix) + lengthOf(file_prefix);
        end_index = indexOf(file_name, file_suffix);
        if (end_index == -1) {
            end_index = indexOf(file_name, ".tiff");
        }
        num_str = substring(file_name, start_index, end_index);
        num = parseInt(num_str);
        // 将文件名和对应的数字放入一个对象中
        images[i] = num;
    }
}

// 按照数字对文件名进行排序
Array.sort(images);

// 打开图像文件并将其添加到图像列表中
for (i = 0; i < images.length; i++) {
    open(folder + "particle_motion_" + images[i] + "_chaotic.tiff");
}

// 选择所有打开的图像
for (i = 0; i < images.length; i++) {
    selectImage("particle_motion_" + images[i] + "_chaotic.tiff");
}

// 将图像堆叠成一个堆栈
run("Images to Stack", "name=Stack title=[] use");
