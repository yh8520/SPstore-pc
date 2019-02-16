const express=require("express");
const pool=require("../pool");
const router=express.Router();
router.get("/details",(req,res)=>{
    var output={product:{},specs:[],pics:[]};
    var lid=req.query.lid;
    if(lid!==undefined){
      var sql=
        "select * from sp_pro where lid=?";
      pool.query(sql,[lid],(err,result)=>{
        if(err) console.log(err);
        output.product=result[0];
        var f_id=output.product.f_id;
        var sql="select lid,spec from sp_pro where f_id=?";
        pool.query(sql,[f_id],(err,result)=>{
          if(err) console.log(err);
          output.specs=result;
          var sql="select * from sp_pic where sp_id=?";
          pool.query(sql,[lid],(err,result)=>{
              console.log(lid)
            if(err) console.log(err);
            output.pics=result;
            res.send(output);
          })
        })
      })
    }else{
      output.err="请提供lid"
      res.send(output);
    }
  })
module.exports=router;