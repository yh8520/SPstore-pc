const express=require("express");
const pool=require("../pool");
const router=express.Router()
router.get("/addCart",(req,res)=>{
    var uid   = parseInt(req.query.uid);
    var pid   = parseInt(req.query.pid);
    var price = parseFloat(req.query.price);
    var count = parseInt(req.query.count);
    var sql=" INSERT INTO `sp_cart`(`id`, ";
        sql+=" `uid`, `pid`, `price`,";
        sql+=" `count`) VALUES (null,?,?,?,?)";
    pool.query(sql,[uid,pid,price,count],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows > 0){
          res.send({code:1,msg:"添加成功"});
        }else{
          res.send({code:-1,msg:"添加失败"});
        }
    })
    //3:json {code:1,msg:"添加成功"}
  }); 
module.exports=router;