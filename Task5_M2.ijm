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
	close();
	close();
	setOption("BlackBackground", false);
	run("Dilate");
	selectWindow("layer_0_");
	run("Dilate");
	imageCalculator("OR create", "layer_0_","layer_1_");
	selectWindow("Result of layer_0_");
	run("Convert to Mask");
	saveAs("Jpeg", results_dir + "blur_" + b + "/" + image + "/" + "Task_5_M2_" + image_name+ ".jpg");
	selectWindow(image_name+ ".jpg");
	close();
	selectWindow("layer_0_");
	close();
	selectWindow("layer_1_");
	close();
	selectWindow("Result of layer_0_");
	close();
    }
  }
}
