package kda.common;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

	public void upload(MultipartFile upload, String fullFilePathNm) throws IOException;
	
	public String uploadFileByGen( MultipartFile upload, String uploadRoot) throws Exception;
	
	public String uploadFile( MultipartFile upload, String uploadRoot, boolean hasExt) throws Exception;
	
	public String uploadFile( MultipartFile upload, String uploadRoot, String subDir) throws Exception;
	
	public String uploadImage(MultipartFile upload, String uploadRoot) throws IOException;
	
	public String uploadImage(MultipartFile upload, String uploadRoot, String subDir) throws IOException; 
	
	public String cropImageUpload( MultipartFile file, String path, int width, int height) throws Exception;
	
	public String cropImageUpload(File file, String path, int width, int height) throws Exception;
	
	public void deleteFile(String filePath) throws IOException;
	
	public void moveFile(String sourcePath, String targetPath) throws IOException;
	
	public String readFile(String path) throws IOException;
	
	public void saveFile(String fullPathFile, String text) throws IOException; 
}
