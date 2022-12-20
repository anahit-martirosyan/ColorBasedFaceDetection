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
	setOption("BlackBackground", false);

	run("Binary Layers");
	selectWindow("layer_0_");
	close();
	selectWindow("layer_1_");
	run("Analyze Particles...", "  show=Ellipses display clear");
	selectWindow("layer_2_");
	run("Analyze Particles...", "  show=Ellipses display clear");
	selectWindow("layer_3_");
	run("Analyze Particles...", "  show=Ellipses clear");

	imageCalculator("AND create", "Drawing of layer_1_","Drawing of layer_1_");
	imageCalculator("AND create", "Result of Drawing of layer_1_","Drawing of layer_3_");
	selectWindow("Result of Result of Drawing of layer_1_");
	saveAs("Jpeg", results_dir + "blur_" + b + "/" + image + "/" + "Task_3_" + image_name + ".jpg");
	selectWindow("Drawing of layer_3_");
	run("Analyze Particles...", "  show=Nothing display clear");
	saveAs("Results", results_dir + "blur_" + b + "/" + image + "/"  + "Task_3_centroid_" + image_name + ".csv");

	selectWindow("layer_1_");
	close();
	selectWindow("layer_2_");
	close();
	selectWindow("layer_3_");
	close();
	selectWindow("Drawing of layer_1_");
	close();
	selectWindow("Drawing of layer_2_");
	close();
	selectWindow("Drawing of layer_3_");
	close();
	selectWindow("Result of Drawing of layer_1_");
	close();
	selectWindow("Result of Result of Drawing of layer_1_");
	close();
	selectWindow(image_name + ".jpg");
	close();
    }
  }
}
