package com.bit.web.controller;

import com.bit.web.model.ReplyDto;
import com.bit.web.service.Service;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/reply")
public class ReplyController {
    @Resource(name = "serviceImpl")
    Service service;

    @GetMapping("/getReplyList/{board_no}")
    public List<Object> selectReplyList(@PathVariable("board_no") int board_no){
        return service.selectReplyList(board_no);
    }
    @GetMapping("/getReply/{no}")
    public Object selectReply(@PathVariable("no") int no){
        return service.selectReply(no);
    }

    @PostMapping("/insertReply")
    public int insertReply(HttpSession session, int board_no, String contents){
        String writer = (String)session.getAttribute("id");
        String format = contents.replace("\n","<br>");
        System.out.println(format);
        return service.insertReply(new ReplyDto(board_no,writer,format,0));
    }

    @PostMapping("/updateReplyContents")
    public int updateReplyContents(int no,String contents){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("reply_no",no);
        map.put("reply_contents",contents);
        return service.updateReplyContents(map);
    }
}
