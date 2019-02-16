const express = require('express');
const bodyParser = require('body-parser');
const Index=require("./routes/index.router.js");
const details=require("./routes/details.router.js");
const register=require("./routes/register.router");
const header=require("./routes/header.router");
const login=require("./routes/login.router");
// const session=require("express-session");
const cors=require("cors");
var app = express();
app.listen(3000);
app.use(bodyParser.urlencoded({extended:false}))
app.use(express.static('static'));
app.use(cors({
  origin:["http://127.0.0.1:5500","http://localhost:5500"]
}))
// app.use(session({
//   secret:"128位随机字符",
//   resave:false,
//   saveUninitialized:true,
//   cookie:{
//     maxAge:1000*60*60*24
//   }
// }))
app.use("/index",Index);
app.use("/details",details);
app.use("/register",register);
app.use("/login",login)
app.use("/header",header)
