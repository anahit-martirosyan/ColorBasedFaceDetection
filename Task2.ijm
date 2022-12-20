results_dir = "/Users/anahitmartirosyan/Documents/aua/2022_fall/image_processing/project/result_images/"
input_dir = "/Users/anahitmartirosyan/Documents/aua/2022_fall/image_processing/project/originalimages_part4/"
for (b=3; b <=7; b+=2) {
  for (image=156; image<=160; image++) {
    for (i=11; i<=13; i++) {
	image_name = "" + image + "-" + i;
	open(input_dir + image_name+".jpg");
	run("Gaussian Blur...", "sigma=" + b);
	run("Binary Layers");
	selectWindow("layer_0_");
	close();
	selectWindow("layer_3_");
	run("Fill Holes");
	selectWindow("layer_2_");
	run("Fill Holes");
	selectWindow("layer_1_");
	run("Fill Holes");
	imageCalculator("OR create", "layer_1_","layer_2_");
	selectWindow("Result of layer_1_");
	imageCalculator("OR create", "Result of layer_1_","layer_3_");
	selectWindow("Result of layer_1_");
	close();
	selectWindow("Result of Result of layer_1_");
	run("Set Measurements...", "centroid redirect=None decimal=3");
	run("Analyze Particles...", "display clear");
	saveAs("Results", results_dir + "blur_" + b + "/" + image + "/"  + "Task_2_centroid_" + image_name+ ".csv");
	selectWindow("Result of Result of layer_1_");
	saveAs("Jpeg", results_dir + "blur_" + b + "/" + image + "/" + "Task_2_" + image_name + ".jpg");

	selectWindow("layer_1_");
	close();
	selectWindow("layer_2_");
	close();
	selectWindow("layer_3_");
	close();
	selectWindow(image + "-" + i + ".jpg");
	close();
	selectWindow("Result of Result of layer_1_");
	close();
    }
  }
}
