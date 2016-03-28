package cn.cnic.foodborn.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.cnic.lfdod.LocalOutbreakDetector;
import cn.cnic.sfdod.SporadicOutbreakDetector;
import cn.cnic.textvector.TextVectorGenerator;

@Controller
public class Control {

	boolean uploadfile(HttpServletRequest request,MultipartFile file, int stepcnt){
		HttpSession session = request.getSession();//通过session保存进度和结果
		session.setAttribute("progress", "0");
		session.setAttribute("result", "uploading");
		session.setAttribute("error", "");
		String error = "";
		int maxSize = 50*1024*1024;//文件上传的最大值，不超过50M
		long fileSize = file.getSize();
		if(fileSize > maxSize){
			error = "您上传的文件太大了，请选择不超过50MB的文件！";
			session.setAttribute("error", error);
			return false;
		}else{
			String fileName = file.getOriginalFilename();
			fileName = "step" + stepcnt + "_" + fileName;
			//File tempFile = new File(fileName);//文件暂存在服务器的内存中，构造临时对象
//			String destPath = "/Users/Alina/Desktop";//设定服务器中文件的存储路径
			String destPath = request.getSession().getServletContext().getRealPath("OutputFile");
			File receivedFile = new File(destPath,fileName);
			// 判断目标路径文件是否存在,如果存在的话进行覆盖
			if(!receivedFile.exists()){
				try {
					receivedFile.createNewFile();
				}catch (IOException e){
					e.printStackTrace();
				}
			}
			try {
				InputStream is = file.getInputStream();
				int length = 0;
				byte[] by = new byte[1024];
				double persent = 0;
				FileOutputStream fos = new FileOutputStream(receivedFile);
				while((length = is.read(by)) != -1 ){
					fos.write(by,0,length);
					persent += length/(double)fileSize * 100;//计算进度
					session.setAttribute("progress", Math.round(persent)+"");
					try {
						Thread.sleep(10);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				fos.close();
				is.close();
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				error = "上传文件出现错误：" + e.getMessage();
				session.setAttribute("error", error);
			}
			if(error.equals("")){
				session.setAttribute("result", "done");
				return true;
			}
			else
				return false;
		}
	}

	//----step1阶段文件上传请求
	@RequestMapping("sporadic_upload_step1.do")
	private void upload( HttpServletRequest request,HttpServletResponse reponse,
			@RequestParam("sporadic_file_step1") MultipartFile file){
		System.out.println("----------------step1:file uploading--------------");
		uploadfile(request,file,1);
		return;
	}
	//step1：查询上传进度
	@RequestMapping("sporadic_progress_step1.do")
	private @ResponseBody String progress(HttpServletRequest request,HttpServletResponse response){
		System.out.println("-------------------step1:progress---------------");
		HttpSession session = request.getSession();
		String progress = (String)session.getAttribute("progress");
		String result = (String)session.getAttribute("result");
		String error = (String)session.getAttribute("error");
		JSONObject json = new JSONObject();
		json.put("progress", progress);
		json.put("result", result);
		json.put("error", error);
		System.out.println(json.toString());
		return "("+json.toString()+")";
	}

	// step 2的文件上传
	@RequestMapping("sporadic_upload_step2.do")
	private void upload2( HttpServletRequest request,HttpServletResponse reponse,
						 @RequestParam("sporadic_file_step2") MultipartFile file,
						 @RequestParam("support_txt_val") int supportval,
                          @RequestParam("step2_checkbox") String checkvals
                          ){
		System.out.println("----------------step2:file uploading--------------");
        if (checkvals.equals("")){
            boolean issuc= uploadfile(request, file, 2);
            if(issuc) {
                // 如果文件上传成功
                String destpath = request.getSession().getServletContext().getRealPath("OutputFile");
                String inputPathSod = destpath + "/step2_" + file.getOriginalFilename();
                String outputPathSod = destpath + "/step2_" + file.getOriginalFilename() + ".res";
                SporadicOutbreakDetector sod = new SporadicOutbreakDetector();
                System.out.println("the sod has been init.....");
                try {
                    sod.detect(inputPathSod, supportval, outputPathSod);
                } catch (Exception e){
                    System.out.println("detect 算法出错");
                    e.printStackTrace();
                }
            }
        }
        else{
			// 如果直接导入预处理文件被勾选
			String destpath = request.getSession().getServletContext().getRealPath("OutputFile");
			String inputPathSod = destpath + "/step1_" + "sfTest.txt" ;// 应该获取第一步上传的文件名,但是这里还没获取写的固定值
			String outputPathSod = destpath + "/step2_" + file.getOriginalFilename() + ".res";
			SporadicOutbreakDetector sod = new SporadicOutbreakDetector();
			System.out.println("the sod has been init.....");
			try {
				sod.detect(inputPathSod, supportval, outputPathSod);
			} catch (Exception e){
				System.out.println("detect 算法出错");
				e.printStackTrace();
			}
        }



	}
	//step2：查询上传进度
	@RequestMapping("sporadic_progress_step2.do")
	private @ResponseBody String progress2(HttpServletRequest request,HttpServletResponse response){
		System.out.println("-------------------step2:progress---------------");
		HttpSession session = request.getSession();
		String progress = (String)session.getAttribute("progress");
		String result = (String)session.getAttribute("result");
		String error = (String)session.getAttribute("error");
		JSONObject json = new JSONObject();
		json.put("progress", progress);
		json.put("result", result);
		json.put("error", error);
		System.out.println(json.toString());
		return "("+json.toString()+")";
	}

}
