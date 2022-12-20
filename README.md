# Color-based Face Detection 

In this project some experiments were done for color-based face detection (based on project description).

## Task 1

For this task - applying different filters before getting binary layers, I've tried 'Mean', 'Median' and 'Gaussian Blur' filter with different parameters. 'Mean' and 'Median' filters didn't work well, hence I continued experimenting with 'Gaussian Blur'. I've tried 'Gaussian Blur' with kernels 3, 5, and 7 in the successive tasks, as on different images different kernels were showing better results.


##   
For tasks 2, 3 and 5 I have created Macros to run over all the images and apply command described.


## Task 2

Algorithm showed better results on images xxx_11.jpg. For some images layer_3_ was empty (including some xxx_11.jpg images). This why you can see empty images in the result. 
Centroids are saved in Task_2_centroid_xxx-xx.csv files. As resulted images not always were connected, there are some files with several centroids reported.


## Task 3 and Task 4

Algorithm showed better results for images with smaller rotations.
As the ellipses described in the 5th point of the task are ellipses from layer_3_, I have calculated centroids for layer_3_. They can be found in Task_3_centroid_xxx-xx.csv.


## Task 5

Here the result of two methods are quite different. Method 1 better shows size of the head/face, method 2 better shows some details of the face.


## Task 6

Here I created low resolution images from the original images, and tried to apply some steps from the task. In most of the images layer_2_ and layer_3_ were empty, hence there was no point to continue. 