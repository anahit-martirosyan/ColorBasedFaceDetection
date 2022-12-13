//package Project;

import ij.IJ;
import ij.ImagePlus;
import ij.plugin.filter.PlugInFilter;
import ij.process.ColorProcessor;
import ij.process.ImageProcessor;

public class LowResolution implements PlugInFilter {
    private String title;
    private String resolution;
    private static int KERNEL_SIZE = 5;

    @Override
    public int setup(String s, ImagePlus imagePlus) {
        this.title = imagePlus.getShortTitle();
        this.resolution = imagePlus.getTitle().split(".")[1];
        return DOES_RGB;
    }

    @Override
    public void run(ImageProcessor inputIP) {
        int width = inputIP.getWidth();
        int height = inputIP.getHeight();
        ImageProcessor outputIP = new ColorProcessor(width / KERNEL_SIZE, height / KERNEL_SIZE);

        for (int col = 0; col < width; col += KERNEL_SIZE) {
            for (int row = 0; row < height; row += KERNEL_SIZE) {
//                int avg = 0;
//                for (int i = 0; i < KERNEL_SIZE; i++) {
//                    for (int j = 0; j < KERNEL_SIZE; j++) {
//                        avg += inputIP.getPixel(col + i, row + j);
//                    }
//                }
//                IJ.log(avg + "");
//                avg = avg / (KERNEL_SIZE * KERNEL_SIZE);
//                outputIP.putPixel(col / KERNEL_SIZE, row / KERNEL_SIZE, avg);
                outputIP.putPixel(col / KERNEL_SIZE, row / KERNEL_SIZE, inputIP.getPixel(col + KERNEL_SIZE / 2, row + KERNEL_SIZE / 2));

            }
        }

        (new ImagePlus(this.title + "_low_res." + this.resolution, outputIP)).show();

    }
}
