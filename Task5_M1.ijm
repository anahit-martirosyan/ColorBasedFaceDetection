results_dir = "/Users/anahitmartirosyan/Documents/aua/2022_fall/image_processing/project/result_images/"
input_dir = "/Users/anahitmartirosyan/Documents/aua/2022_fall/image_processing/project/originalimages_part4/"
for (b=3; b <=7; b+=2) {
  for (image=156; image<=160; image++) {
    for (i=1; i<=13; i++) {
	if (i < 10) {
	  image_name = "" + image + "-0" + i;
	} else {
	  image_name = "" + image + "-" + i;
	}
	open(input_dir + image_name + ".jpg");
	run("Gaussian Blur...", "sigma=" + b);
	run("Binary Layers");
	selectWindow("layer_3_");
	close();
	selectWindow("layer_2_");
	close();
	selectWindow("layer_1_");
	close();
	setOption("BlackBackground", false);
	run("Convert to Mask");
	run("Skeletonize");
	saveAs("Jpeg", results_dir + "blur_" + b + "/" + image + "/" + "Task_5_M1_" + image_name + ".jpg");
	selectWindow(image_name+ ".jpg");
	close();
	selectWindow("layer_0_");
	close();
    }
  }
}
