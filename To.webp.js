import imagemin from "imagemin";
import webp from "imagemin-webp";
import path from "path";
import fs from "fs";

// Function to create the output directory structure if it doesn't exist
function createOutputDir(filePath) {
    const dir = path.dirname(filePath);
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
    }
}

// Main function to convert images
async function convertImages() {
    const inputDir = "assets/images/**/*.{jpg,jpeg,png}"; // Includes all subfolders in assets/images
    const outputDir = ""; // Use the same folder for saving the WebP images

    await imagemin([inputDir], {
        destination: "",  // Empty destination means overwrite in the same folder
        plugins: [
            webp({
                quality: 90, // Set quality here (100 for lossless)
                lossless: 9,
                method: 6
            }),
        ],
    }).then(() => {
        console.log("Images converted to WebP!");
    }).catch((err) => {
        console.error("Error during image conversion:", err);
    });
}

// Run the conversion process
convertImages();
