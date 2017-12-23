
package com.baroservice.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>anonymous complex type에 대한 Java 클래스입니다.
 * 
 * <p>다음 스키마 단편이 이 클래스에 포함되는 필요한 콘텐츠를 지정합니다.
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="CERTKEY" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="CorpNum" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="SenderID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="SendCount" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *         &lt;element name="CutToSMS" type="{http://www.w3.org/2001/XMLSchema}boolean"/&gt;
 *         &lt;element name="Messages" type="{http://ws.baroservice.com/}ArrayOfXMSMessage" minOccurs="0"/&gt;
 *         &lt;element name="SendDT" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "certkey",
    "corpNum",
    "senderID",
    "sendCount",
    "cutToSMS",
    "messages",
    "sendDT"
})
@XmlRootElement(name = "SendMessages")
public class SendMessages {

    @XmlElement(name = "CERTKEY")
    protected String certkey;
    @XmlElement(name = "CorpNum")
    protected String corpNum;
    @XmlElement(name = "SenderID")
    protected String senderID;
    @XmlElement(name = "SendCount")
    protected int sendCount;
    @XmlElement(name = "CutToSMS")
    protected boolean cutToSMS;
    @XmlElement(name = "Messages")
    protected ArrayOfXMSMessage messages;
    @XmlElement(name = "SendDT")
    protected String sendDT;

    /**
     * certkey 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCERTKEY() {
        return certkey;
    }

    /**
     * certkey 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCERTKEY(String value) {
        this.certkey = value;
    }

    /**
     * corpNum 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCorpNum() {
        return corpNum;
    }

    /**
     * corpNum 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCorpNum(String value) {
        this.corpNum = value;
    }

    /**
     * senderID 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSenderID() {
        return senderID;
    }

    /**
     * senderID 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSenderID(String value) {
        this.senderID = value;
    }

    /**
     * sendCount 속성의 값을 가져옵니다.
     * 
     */
    public int getSendCount() {
        return sendCount;
    }

    /**
     * sendCount 속성의 값을 설정합니다.
     * 
     */
    public void setSendCount(int value) {
        this.sendCount = value;
    }

    /**
     * cutToSMS 속성의 값을 가져옵니다.
     * 
     */
    public boolean isCutToSMS() {
        return cutToSMS;
    }

    /**
     * cutToSMS 속성의 값을 설정합니다.
     * 
     */
    public void setCutToSMS(boolean value) {
        this.cutToSMS = value;
    }

    /**
     * messages 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfXMSMessage }
     *     
     */
    public ArrayOfXMSMessage getMessages() {
        return messages;
    }

    /**
     * messages 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfXMSMessage }
     *     
     */
    public void setMessages(ArrayOfXMSMessage value) {
        this.messages = value;
    }

    /**
     * sendDT 속성의 값을 가져옵니다.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSendDT() {
        return sendDT;
    }

    /**
     * sendDT 속성의 값을 설정합니다.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSendDT(String value) {
        this.sendDT = value;
    }

}
