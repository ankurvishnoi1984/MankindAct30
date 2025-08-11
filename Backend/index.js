const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");
const multer = require("multer");
const cors = require("cors");
const dotenv = require("dotenv");
const authRoutes = require("./routes/auth")
const catRoutes = require("./routes/cat")
const campRoutes = require("./routes/camp")
const docRoutes = require("./routes/doctor")
const dashRoutes = require("./routes/dashboard")
const repoRoutes = require("./routes/report")
const adminRoutes = require("./routes/adminDashboard")
const basicRoutes = require('./routes/basic')
const logger = require("./utils/logger");
const path = require("path");
const sharp = require("sharp");
const fs = require("fs");
const axios = require('axios')
const moment = require('moment');
const {registerFont, createCanvas, loadImage } = require('canvas');

const db = require("./config/db")
const { addDoctor, updateDoctor, addDoctor1 } = require("./controller/doctor");
const { uploadImage, updateImages } = require("./controller/report");


// Middleware and configuration
const app = express();
app.use(express.json());
app.use(cors());
app.use((req, res, next) => {
  res.setHeader('Cache-Control', 'no-cache');
  next();
});

// multer configuration
const uploadsfile = path.join(__dirname, "./uploads/profile");
app.use("/uploads/profile",express.static(uploadsfile));

const uploadsfile1 = path.join(__dirname, "./uploads/report");
app.use("/uploads/report",express.static(uploadsfile1));

const uploadsfile2 = path.join(__dirname, "./uploads/poster");
app.use("/uploads/poster",express.static(uploadsfile2));

const uploadsfile3 = path.join(__dirname, "");
app.use("",express.static(uploadsfile3));


const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname,"./uploads/profile"))
  },
  filename: function (req, file, cb) {
    const uniquePrefix = Date.now()+ Math.random().toString();
    cb(null, uniquePrefix+file.originalname)
  }
})


// multer configuration for report upload images

const reportStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    const uploadPath = path.join(__dirname, "./uploads/report");
    cb(null, uploadPath);
  },
  filename: function (req, file, cb) {
    const uniquePrefix = Date.now() + Math.random().toString();
    cb(null, uniquePrefix + file.originalname);
  },
});

// file filter to set image type
const imageFilter = function (req, file, cb) {
  if (
    file.mimetype === "image/jpeg" ||
    file.mimetype === "image/png"
  ) {
    cb(null, true);
  } else {
    cb(new Error("Only JPG and PNG files are allowed."), false);
  }
};

const upload = multer({ storage: storage,fileFilter: imageFilter })

const imageUpload = multer({ storage: reportStorage, fileFilter: imageFilter });

// routes with file upload
app.post("/doc/addDoctor",upload.single('image'),addDoctor);
//app.post("/doc/addDoctorWithNormal",upload.single('image'),addDoctor1);

app.post("/doc/updateDoctor", upload.single('image'),updateDoctor)
app.post("/report/uploadImages",imageUpload.array("images", 10),uploadImage);
app.post("/report/updateImages",imageUpload.array("images", 10),updateImages);


//Auth Routes
app.use("/auth",authRoutes)

// Category Routes
app.use("/cat",catRoutes)

// Camp Routes
app.use("/camp",campRoutes)

// Doctor Routes
app.use('/doc',docRoutes)

// Dashboard Routes
app.use("/dashboard",dashRoutes)

// Camp Report Routes
app.use("/report",repoRoutes)

// Admin Routes
app.use("/admin",adminRoutes)

app.use("/basic",basicRoutes)
// image combining code 



async function translateText(text, from, to) {
  const options = {
    method: "POST",
    url: "https://rapid-translate-multi-traduction.p.rapidapi.com/t",
    headers: {
      "content-type": "application/json; charset=utf-8",
      //"X-RapidAPI-Key": "7f0907abe3mshbffd796f0d1e962p13edb0jsn184e1efe60fb",
      //8492112e92msh92e835f0c40d894p18827fjsn575ba42c412b
      //"X-RapidAPI-Key": "8492112e92msh92e835f0c40d894p18827fjsn575ba42c412b",
      'X-RapidAPI-Key': 'e9ba6be376msh6459eaf88a66f67p1ee386jsnb992589e2f0c',
      "X-RapidAPI-Host": "rapid-translate-multi-traduction.p.rapidapi.com",
    },
    data: {
      from: from,
      to: to,
      q: text,
    },
  };

  try {
    const response = await axios.request(options);
    //console.log("insie tra",response.data)
    //logger.error("sucsess"+response.data[0])
    return response.data[0];
  } catch (error) {
    console.error(error);
    logger.error("error in translate api")
    return text; // Return original text in case of error
  }
}

function getPosterData(postername) {
  return new Promise((resolve, reject) => {
    const posterDataQuery = "SELECT * FROM poster_field_mst WHERE poster_name = ?";

    db.query(posterDataQuery, [postername], (err, result) => {
      if (err) {
        logger.error("error in index/getPosterData",err.message); 
        reject(err);
      } else {
        //console.log(result[0]);
        const pdata = result[0];
        resolve(pdata);
      }
    });
  });
}


// working code with sharp 
async function addTextOnImage(waterMarkImage,name,date,venue,time,postername,posterpath,docId,lang,width,height,subCatId) {
 
  try {
     
      let obj = await getPosterData(postername);

    
       const { nx,ny,vx,vy,dx,dy,tx,ty,fs,iw,ih,it,il,c,nta,vta} = obj;


     
      //const text1 = translatedName ? translatedName : name;
      //const text2 =  translatedVenue ? translatedVenue : venue;
      const text1 = name;
      const text2 = venue;
      const text3 = date;
      const text4 = time;
     
      let svgImage;

      if (subCatId == 1 || subCatId ==2){

 svgImage = `
      <svg width="${width}" height="${height}">
           <style>
            .title { fill: ${c}; font-size: ${fs}px; font-weight: 500; font-family:Arial,sans-serif;}
            .bold { font-weight: bold; }
            </style>
           <text x="${nx}%" y="${ny}%" text-anchor="${nta}" class="title bold">${text1}</text>
            <text x="${dx}%" y="${dy}%" text-anchor="left" class="title">${text3}</text>
            <text x="${tx}%" y="${ty}%" text-anchor="left" class="title">${text4}</text>
         </svg>
          `;

 const svgBuffer = Buffer.from(svgImage);
 let imgname = `test/${docId}-${postername}-${lang}-${subCatId}.png`

 const compositeOptions = [
  {
      input: svgBuffer,
      // top: 3600,
      // left: 400,
  },
];

// if (circularImage) {

//   compositeOptions.push({
//       input: circularImage,
//       top: it,
//       left: il,
//       // gravity: 'northwest' // Adjust gravity as needed
//   });
// }
 const image = await sharp(`${uploadsfile2}/${posterpath}`)  
 .composite(compositeOptions)
 .toFile(imgname);
 return imgname;

     
  }

  else if (subCatId == 3){

    svgImage = `
         <svg width="${width}" height="${height}">
              <style>
               .title { fill: ${c}; font-size: ${fs}px; font-weight: 500; font-family:Arial,sans-serif;}
                .bold { font-weight: bold; }
               </style>
              <text x="${nx}%" y="${ny}%" text-anchor="${nta}" class="title bold">${text1}</text>
               <text x="${dx}%" y="${dy}%" text-anchor="left" class="title">${text3}</text>
               <text x="${tx}%" y="${ty}%" text-anchor="left" class="title">${text4}</text>
            </svg>
             `;
   
    const svgBuffer = Buffer.from(svgImage);
    let imgname = `test/${docId}-${postername}-${lang}-${subCatId}.png`
   
    const compositeOptions = [
     {
         input: svgBuffer,
         // top: 3600,
         // left: 400,
     },
   ];
   
   // if (circularImage) {
   
   //   compositeOptions.push({
   //       input: circularImage,
   //       top: it,
   //       left: il,
   //       // gravity: 'northwest' // Adjust gravity as needed
   //   });
   // }
    const image = await sharp(`${uploadsfile2}/${posterpath}`)  
    .composite(compositeOptions)
    .toFile(imgname);
    return imgname;
   
        
     }



      // if(subCatId == 1 || subCatId == 2 || subCatId == 3){
      //   //const watermark = await sharp(`${uploadsfile}/${waterMarkImage}`);
      // //console.log("image found ", waterMarkImage);
      //   let circularImage;
      //   if(waterMarkImage){

      //     const resizedWatermarkBuffer = await sharp(`${uploadsfile}/${waterMarkImage}`)
      //              .resize({ width:iw, height: ih, fit: "cover" })
      //              .toBuffer();
    
      //      circularImage = await makeCircularImage(resizedWatermarkBuffer,iw,ih);
      //   }

      //   svgImage = `
      //        <svg width="${width}" height="${height}">
      //             <style>
      //              .title { fill: #001; font-size: ${fs}px; font-weight: bold; font-family:sans-serif}
      //              </style>
      //              <text x="${nx}%" y="${ny}%" text-anchor="left" class="title">${text1}</text>
      //              <text x="${vx}%" y="${vy}%" text-anchor="left" class="title">${text2}</text>
            
      //           </svg>
      //            `;

      //   const svgBuffer = Buffer.from(svgImage);
      //   let imgname = `test/${docId}-${postername}-${lang}-${subCatId}.jpg`

      //   const compositeOptions = [
      //     {
      //         input: svgBuffer,
      //         // top: 3600,
      //         // left: 400,
      //     },
      // ];
  
      // if (circularImage) {
       
      //     compositeOptions.push({
      //         input: circularImage,
      //         top: it,
      //         left: il,
      //         // gravity: 'northwest' // Adjust gravity as needed
      //     });
      // }
      // const image = await sharp(`${uploadsfile2}/${posterpath}`)
      // .composite(compositeOptions)
      // .toFile(imgname);
      // return imgname;
      // }
      // else if(subCatId == 3 || subCatId == 6){
      //   // svgImage = `
      //   // <svg width="${width}" height="${height}">
      //   //   <style>
      //   //   .title { fill: #001; font-size: ${fs}px; font-weight: bold; font-family:sans-serif}
      //   //   </style>
      //   //   <text x="${nx}%" y="${ny}%" text-anchor="left" class="title">${text1}</text>
      //   //   <text x="${vx}%" y="${vy}%" text-anchor="left" class="title">${text2}</text>
    
      //   // </svg>
      //   // `;

      //   // const svgBuffer = Buffer.from(svgImage);
      //   // let imgname = `test/${docId}-${postername}-${lang}-${subCatId}.jpg`
      //   // const image = await sharp(`${uploadsfile2}/${posterpath}`)
      //   //   .composite([
      //   //     {
      //   //       input: svgBuffer,
      //   //       // top: 3600,
      //   //       // left: 400,
      //   //     },
      //   //   ])
      //   //   .toFile(imgname)
      //   //   return imgname;

      //   let imgname = `test/${docId}-${postername}-${lang}-${subCatId}.jpg`;

      // // Instead of using .composite(), just directly save the original image
      //   const image = await sharp(`${uploadsfile2}/${posterpath}`)
      //   .toFile(imgname);

      //   return imgname;
      // }

     
      
//       else if (subCatId === 1){
//        //console.log("inside subcat id", subCatId)
//         let circularImage;
//         if(waterMarkImage){
//           const resizedWatermarkBuffer = await sharp(`${uploadsfile}/${waterMarkImage}`)
//         .resize({ width:iw, height: ih, fit: "cover" })
//         .toBuffer();

//         circularImage = await makeCircularImage(resizedWatermarkBuffer,iw,ih);
//         }

//  svgImage = `
//       <svg width="${width}" height="${height}">
//            <style>
//             .title { fill: ${c}; font-size: ${fs}px; font-weight: 500; font-family:Arial,sans-serif;}
//             </style>
//             <text x="${nx}%" y="${ny}%" text-anchor="${nta}" class="title">${text1}</text>
//             <text x="${vx}%" y="${vy}%" text-anchor="${vta}" class="title">${text2}</text>
//             <text x="${dx}%" y="${dy}%" text-anchor="left" class="title">${text3}</text>
//             <text x="${tx}%" y="${ty}%" text-anchor="left" class="title">${text4}</text>
//          </svg>
//           `;

//  const svgBuffer = Buffer.from(svgImage);
//  let imgname = `test/${docId}-${postername}-${lang}-${subCatId}.jpg`

//  const compositeOptions = [
//   {
//       input: svgBuffer,
//       // top: 3600,
//       // left: 400,
//   },
// ];

// if (circularImage) {

//   compositeOptions.push({
//       input: circularImage,
//       top: it,
//       left: il,
//       // gravity: 'northwest' // Adjust gravity as needed
//   });
// }
//  const image = await sharp(`${uploadsfile2}/${posterpath}`)  
//  .composite(compositeOptions)
//  .toFile(imgname);
//  return imgname;

     
//   }
//   else if (subCatId === 2 || subCatId === 5){
//     //console.log("inside subcat id", subCatId)
//     //  let circularImage;
//     //  if(waterMarkImage){
//     //    const resizedWatermarkBuffer = await sharp(`${uploadsfile}/${waterMarkImage}`)
//     //  .resize({ width:iw, height: ih, fit: "cover" })
//     //  .toBuffer();

//     //  circularImage = await makeCircularImage(resizedWatermarkBuffer,iw,ih);
//     //  }

// svgImage = `
//    <svg width="${width}" height="${height}">
//         <style>
//          .title { fill: ${c}; font-size: ${fs}px; font-weight: 500; font-family:Arial,sans-serif;}
//          </style>
        
    
//          <text x="${dx}%" y="${dy}%" text-anchor="left" class="title">${text3}</text>
//          <text x="${tx}%" y="${ty}%" text-anchor="left" class="title">${text4}</text>
//          <text x="${vx}%" y="${vy}%" text-anchor="${vta}" class="title">${text2}</text>
//       </svg>
//        `;

// const svgBuffer = Buffer.from(svgImage);
// let imgname = `test/${docId}-${postername}-${lang}-${subCatId}.jpg`

// const compositeOptions = [
// {
//    input: svgBuffer,
//    // top: 3600,
//    // left: 400,
// },
// ];

// const image = await sharp(`${uploadsfile2}/${posterpath}`)  
// .composite(compositeOptions)
// .toFile(imgname);
// return imgname;

  
// }

//       else if (subCatId === 4){
      
//         let circularImage;
//         if(waterMarkImage){
//           const resizedWatermarkBuffer = await sharp(`${uploadsfile}/${waterMarkImage}`)
//         .resize({ width:iw, height: ih, fit: "cover" })
//         .toBuffer();

//         circularImage = await makeCircularImage(resizedWatermarkBuffer,iw,ih);
//         }

//     svgImage = `
//       <svg width="${width}" height="${height}">
//             <style>
//             .title { fill: ${c}; font-size: ${fs}px; font-weight: bold; font-family:sans-serif;}
//             </style>
//             <text x="${nx}%" y="${ny}%" text-anchor="${nta}" class="title">${text1}</text>
            
//             <text x="${dx}%" y="${dy}%" text-anchor="left" class="title">${text3}</text>
//             <text x="${tx}%" y="${ty}%" text-anchor="left" class="title">${text4}</text>
//           </svg>
//           `;

//     const svgBuffer = Buffer.from(svgImage);
//     let imgname = `test/${docId}-${postername}-${lang}-${subCatId}.jpg`

//     const compositeOptions = [
//     {
//       input: svgBuffer,
//       // top: 3600,
//       // left: 400,
//     },
//     ];

//     if (circularImage) {

//     compositeOptions.push({
//       input: circularImage,
//       top: it,
//       left: il,
//       // gravity: 'northwest' // Adjust gravity as needed
//     });
//     }
//     const image = await sharp(`${uploadsfile2}/${posterpath}`)  
//     .composite(compositeOptions)
//     .toFile(imgname);
//     return imgname;

      
//     }
     
  } catch (error) {
    logger.error("error in index/addTextOnImage",error.message);
    console.log(error);
  }
}


const makeCircularImage = async (imageBuffer,wi,he) => {
  // console.log("🚀 ~ makeCircularImage ~ imageBuffer:", imageBuffer);
  try {
    const buffer = await sharp(imageBuffer)
      .resize(wi, he) // Decreased the size for a smaller image
      .composite([
        {
          input: Buffer.from(
            `<svg 
            xmlns="http://www.w3.org/2000/svg"
             width="${wi}" height="${he}">
              <rect x="0" y="0" width="${wi}" height="${he}" rx="${wi/2}" ry="${he/2}" />
            </svg>`
          ),
          blend: "dest-in",
        },
      ])
      .png()
      .toBuffer();

    // console.log("Rounded image created successfully:", buffer);
    return buffer;
  } catch (error) {
    logger.error("error in index/makeCircularImage",error.message);
    console.log({ error: error.message });
  }
};




app.post("/addPoster", (req, res) => {
  const { docId, lang, subCatId } = req.body;

 const query = 'select doctor_name,doctor_img,doctor_qualification,camp_date,camp_time, camp_venue from doctor_mst where doctor_id = ?'
 
 try {
    db.query(query, [docId], async (err, result) => {
      if (err) {
        // Handle the database error
        logger.error("error in index/addposter1",err.message);
       return res.status(500).json({
          errorCode: "INTERNAL_SERVER_ERROR",
          errorDetail: err,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred"
        });
      } else {
        
        
        const data = result[0];
        //console.log("doctor data",data)

        const posternameQuery = "SELECT poster_path, postername, language, width, height FROM poster_mst WHERE subcat_id = ? and language = ? and status = 'Y'";
        
        db.query(posternameQuery, [subCatId,lang], async (posterErr, posterResult) => {
          if (posterErr) {
            // Handle the database error for retrieving postername
            logger.error("error in index/addposter2",err.message);
           return res.status(500).json({
              errorCode: "INTERNAL_SERVER_ERROR",
              errorDetail: posterErr,
              responseData: {},
              status: "ERROR",
              details: "An internal server error occurred while retrieving the postername",
              getMessageInfo: "An internal server error occurred"
            });
          } 
          else {
            
          
             let element = posterResult[0]
             let translatedName = data.doctor_name;
             let translatedVenue = data.camp_venue;

           
             
              const posterpath = element.poster_path;
              const postername = element.postername;
              const width = element.width;
              const height = element.height;
              
              const formatedDate =  moment(data.camp_date).format('DD MMM YYYY').toUpperCase()
              const poster = await addTextOnImage(data.doctor_img, translatedName, formatedDate, translatedVenue,data.camp_time,postername,posterpath,docId,lang,width,height,subCatId);
               
              //console.log("poster",poster)
             
             const insertQuery = 'CALL AddPoster(?,?,?,?)'
  
              //console.log(docId,posterType,lang, poster);
              db.query(insertQuery, [docId,lang,poster,subCatId], (insertErr, insertResult) => {
                if (insertErr) {
                  console.log("insert error",insertErr);
                  logger.error("error in index/addposter3",insertErr);
                 return  res.status(500).json({
                    errorCode: "INTERNAL_SERVER_ERROR",
                    errorDetail: insertErr,
                    responseData: {},
                    status: "ERROR",
                    details: "An internal server error occurred while inserting/updating the poster path",
                    getMessageInfo: "An internal server error occurred"
                  });
                } else {
                  console.log(`Poster path saved/updated in the database: ${poster}`);
                 // res.status(200).json({ poster,message: "Poster Added Successfully",errorCode: "1" });
                }
              });
            

            res.status(200).json({ message: "Poster Added Successfully",errorCode: "1" });

          }
        });
      }
    });
  } catch (error) {
    logger.error("error in index/addposter4",error.message);
    res.send(error);
  }
});




const PORT = process.env.PORT || 8029
app.listen(PORT, async () => {
  try {
    console.log(`listining on port ${PORT}`);
  } catch (error) {
    console.log(error);
  }
});
