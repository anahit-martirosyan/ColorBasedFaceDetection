output_dir = "/Users/anahitmartirosyan/Documents/aua/2022_fall/image_processing/project/low_resolution_images/"
input_dir = "/Users/anahitmartirosyan/Documents/aua/2022_fall/image_processing/project/originalimages_part4/"
  for (image=156; image<=160; image++) {
    for (i=1; i<=13; i++) {
	if (i < 10) {
	  image_name = "" + image + "-0" + i;
	} else {
	  image_name = "" + image + "-" + i;
	}
	open(input_dir + image_name+".jpg");
	run("Mean...", "radius=5");
	run("Compile and Run...", "compile=/Applications/ImageJ.app/plugins/my_plugins/LowResolution.java");
	selectWindow("low_res");
	saveAs("Jpeg", output_dir + image_name+ "_low_res.jpg");
	selectWindow("low_res");
	close();
	selectWindow(image_name+".jpg");
	close();
  }
}
