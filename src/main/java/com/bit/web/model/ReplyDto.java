package com.bit.web.model;

public class ReplyDto {
    int reply_no;
    int reply_board_no;
    String reply_writer;
    String reply_contents;
    int reply_parent;
    String reply_regdate;

    public ReplyDto() {
        reply_parent = 0;
    }

    public ReplyDto(int reply_board_no, String reply_writer, String reply_contents, int reply_parent) {
        this.reply_board_no = reply_board_no;
        this.reply_writer = reply_writer;
        this.reply_contents = reply_contents;
        this.reply_parent = reply_parent;
    }

    public int getReply_no() {
        return reply_no;
    }

    public void setReply_no(int reply_no) {
        this.reply_no = reply_no;
    }

    public int getReply_board_no() {
        return reply_board_no;
    }

    public void setReply_board_no(int reply_board_no) {
        this.reply_board_no = reply_board_no;
    }

    public String getReply_writer() {
        return reply_writer;
    }

    public void setReply_writer(String reply_writer) {
        this.reply_writer = reply_writer;
    }

    public String getReply_contents() {
        return reply_contents;
    }

    public void setReply_contents(String reply_contents) {
        this.reply_contents = reply_contents;
    }

    public int getReply_parent() {
        return reply_parent;
    }

    public void setReply_parent(int reply_parent) {
        this.reply_parent = reply_parent;
    }

    public String getReply_regdate() {
        return reply_regdate;
    }

    public void setReply_regdate(String reply_regdate) {
        this.reply_regdate = reply_regdate;
    }
}
