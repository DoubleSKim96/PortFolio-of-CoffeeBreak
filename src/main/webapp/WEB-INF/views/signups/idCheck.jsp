<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
 <!-- 위의 내용은 자바 코딩이기 때문에 줄한줄이 생기는데 trimDirectiveWhitespaces="true" 이걸 넣어 줄을 없앤다. -->
 
    ${(empty id)? = "사용 가능한 아이디입니다. " : "중복된 아이디 입니다."}