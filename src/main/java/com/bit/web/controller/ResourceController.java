package com.bit.web.controller;

import com.bit.web.Config.Config;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@RestController
@RequestMapping("/resources")
public class ResourceController {
    @GetMapping("/upload/{filename:.+}")
    public ResponseEntity<byte[]> test1(@PathVariable("filename") String filename){
        String uploadSrc = Config.FILEUPLOAD.url();
        File file = new File(uploadSrc+filename);
        ResponseEntity<byte[]> result = null;
        try {
            HttpHeaders header = new HttpHeaders();
            header.add("Content-type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        }catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
}
