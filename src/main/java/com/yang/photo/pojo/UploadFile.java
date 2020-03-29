package com.yang.photo.pojo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.InputStream;

public class UploadFile {
    private CommonsMultipartFile file;
    //上传文件路径
    private String uploadFilePath;
    //上传文件名
    private String uploadFileName;
    //上传文件内容
    private InputStream inputStream;

    public CommonsMultipartFile getFile() {
        return file;
    }

    public void setFile(CommonsMultipartFile file) {
        this.file = file;
    }

    public String getUploadFilePath() {
        return uploadFilePath;
    }

    public void setUploadFilePath(String uploadFilePath) {
        this.uploadFilePath = uploadFilePath;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
