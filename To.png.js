import sharp from "sharp";
import { readdir } from "fs";

let regex = new RegExp(/.(jpg|jpeg|png|gif|webp|JPG|JPEG|PNG|GIF|WEBP)$/);
let numberProccessed = 0;

readdir("sources", (err, files) => {
  if (err) console.log(err);
  else {
    files.forEach((file) => {
      let withDir = "sources/" + file;
      const changedExtension = file.replace(regex, ".png");
      let output = "output/" + changedExtension;
      sharp(withDir).toFormat("png").toFile(output);

      numberProccessed += 1;
    });
    console.log("Images converted to png!");
    console.log("\nNumber of proccesed files: ", numberProccessed);
  }
});
