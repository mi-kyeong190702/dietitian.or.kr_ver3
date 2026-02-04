package kda.common;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

import kda.utils.KdaSecUtil;
import kda.utils.KdaStringUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("fileUplaodService")
public class FileUplaodServiceImpl implements FileUploadService {
	
	private Log log = LogFactory.getLog(FileUplaodServiceImpl.class);
	
	@Override
	public String uploadFileByGen(MultipartFile upload, String uploadRoot)
			throws Exception {
		return uploadFile(upload, uploadRoot, null);
	}
	
	@Override
	public String uploadFile(MultipartFile upload, String uploadRoot, boolean hasExt) throws Exception {
		return uploadFile(upload, uploadRoot, null, hasExt);
	}

	
	public String uploadFile(MultipartFile upload, String uploadRoot, String subDir) 
			throws Exception {

		return  uploadFile( upload, uploadRoot, subDir, false);
	}
	
	private  String uploadFile(MultipartFile upload, String uploadRoot, String subDir, boolean hasExt) 
			throws Exception {
		
		if(upload.getOriginalFilename().endsWith(".wmv")){
			return "";
		}
		String path = uploadRoot;
		if( !KdaStringUtil.isEmpty(subDir) )
			path = path + File.separator + subDir;
		
		File uploadDir = new File(path);
		if( !uploadDir.exists() || uploadDir.isFile() )
			uploadDir.mkdirs();
		String fileExt = null;
		if( hasExt )
			fileExt = KdaStringUtil.getExtension(upload.getOriginalFilename());
		
		String fileName = generateStreFileName(path, fileExt);
		
		File destFile = new File( path + File.separator + fileName );
		upload.transferTo(destFile);
			
		return fileName;
	}
	
	
	@Override	
	public void upload(MultipartFile upload, String fullFilePathNm) throws IOException {
	
		String uploadPath = KdaStringUtil.getFilePath(fullFilePathNm);
		if( !KdaStringUtil.isEmpty(uploadPath) ) {
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists() || uploadDir.isFile()) 
				uploadDir.mkdirs();
		}
		File uploadFile = new File(fullFilePathNm);
		upload.transferTo(uploadFile);
	}
	


	@Override	
	public String uploadImage(MultipartFile upload, String uplaodRoot ) throws IOException {
		return uploadImage(upload, uplaodRoot, null);
	}
	
	@Override
	public String uploadImage(MultipartFile upload, String uploadRoot, String subDir) throws IOException {
		if(upload.getOriginalFilename().endsWith(".wmv")){
			return "";
		}
		String path = uploadRoot;
		if( !KdaStringUtil.isEmpty(subDir))
			path = path + File.separator + subDir;
		
		File uploadDir = new File(path);
		if( !uploadDir.exists() || uploadDir.isFile() )
			uploadDir.mkdirs();
		
		
		String fileName = generatStreFileNameExt(upload.getOriginalFilename(), path);
		File destFile = new File( path + File.separator + fileName );
		upload.transferTo(destFile);
		return fileName;
	}
	
	public String cropImageUpload(MultipartFile file, String path, int width, int height) throws Exception { 
		String saveImageName = cropImageSave(ImageIO.read(file.getInputStream()), width, height, path); 
		return saveImageName;
	}
	
	public String cropImageUpload(File file, String path, int width, int height) throws Exception { 
		String saveImageName = cropImageSave(ImageIO.read(file), width, height, path);
		return saveImageName;
	}
	
	private String cropImageSave(BufferedImage buffer, int width, int height, String path) throws IOException {
		if( path.endsWith(File.separator)  )
			path = path.substring(0, path.length() - 1);

		
		File uploadDir = new File( path );
		if( !uploadDir.exists() || uploadDir.isFile() )
			uploadDir.mkdirs();
		
		BufferedImage dest = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = dest.createGraphics();
		g.setComposite(AlphaComposite.Src);
		g.drawImage(buffer, 0, 0, width, height, null);
		g.dispose();
		
		String fileName = generateStreFileName(path, null);
		String saveImageName = fileName + ".jpg";
		ImageIO.write(dest, "jpg", new File(path + File.separator +saveImageName));
		return saveImageName;
	}
	
	private String generateStreFileName(String path, String ext) {
		String uploadTime = KdaStringUtil.getCurrentDateTimeAsString() + KdaStringUtil.getCurrentMilliSecondAsString();
		int index = 1;
		String fileName =  uploadTime + index;
		if( ext != null && !ext.equals("")  ) {
			fileName = fileName + "." + ext;
		}
		
		while( new File( path + File.separator + fileName).exists() ) {
			index++;
			fileName = uploadTime + index;
			if( ext != null && !ext.equals("")  ) {
				fileName = fileName + "." + ext;
			}
		}
		return fileName;
	}

	private String generatStreFileNameExt(String fileName,  String path) {
		String ext = KdaStringUtil.getExtension(fileName);
		String uploadTime = KdaStringUtil.getCurrentDateTimeAsString() + KdaStringUtil.getCurrentMilliSecondAsString();
		
		int index = 1;
		String uploadName =  uploadTime + index + "." + ext;
		while( new File( path + File.separator + uploadName).exists() ) {
			index++;
			uploadName = uploadTime + index + "." + ext;
		}
		return uploadName;
		
	}

	@Override
	public void deleteFile(String filePath) throws IOException {
		File file = new File(filePath);
		if( file.isFile() && file.exists() )
			file.delete();
	}

	@Override
	public void moveFile(String sourcePath, String targetPath)
			throws IOException {

		
		String targetDirName = KdaStringUtil.getFilePath(targetPath);
		if( !KdaStringUtil.isEmpty(targetDirName) ) {
			File targetDit = new File(targetDirName);
			if (!targetDit.exists() || targetDit.isFile()) 
				targetDit.mkdirs();
		}
		
		File sourceFile = new File(sourcePath);

		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		FileChannel fcin = null;
		FileChannel fcout = null;
		try {
			inputStream = new FileInputStream(sourceFile);
			outputStream = new FileOutputStream(targetPath);

			fcin = inputStream.getChannel();
			fcout = outputStream.getChannel();

			long size = fcin.size();
			fcin.transferTo(0, size, fcout);
		} catch (FileNotFoundException ex){
			log.info("Exception : " + ex.toString());
		} catch (Exception e) {
			//e.printStackTrace();
			log.info("Exception : " + e.toString());
		} finally {
			try { fcout.close(); } catch (IOException ioe) {}
			try { fcin.close(); } catch (IOException ioe) {}
			try { outputStream.close(); } catch (IOException ioe) {}
			try {inputStream.close(); } catch (IOException ioe) {
			}
		}
	}

	@Override
	public String readFile(String path) throws IOException {
		path = KdaSecUtil.checkPath(path);
		String contents = new String(Files.readAllBytes(Paths.get(path)), StandardCharsets.UTF_8);
		return contents;
	}

	@Override
	public void saveFile(String fullPathFile, String text) throws IOException {
		fullPathFile = KdaSecUtil.checkPath(fullPathFile);
		Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fullPathFile), "UTF-8"));
		try {
			out.write(text);
		} finally{
			out.close();
		}
	}




}
