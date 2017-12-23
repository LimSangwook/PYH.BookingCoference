
package com.baroservice.ws;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>ArrayOfXMSMessage complex type에 대한 Java 클래스입니다.
 * 
 * <p>다음 스키마 단편이 이 클래스에 포함되는 필요한 콘텐츠를 지정합니다.
 * 
 * <pre>
 * &lt;complexType name="ArrayOfXMSMessage"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="XMSMessage" type="{http://ws.baroservice.com/}XMSMessage" maxOccurs="unbounded" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfXMSMessage", propOrder = {
    "xmsMessage"
})
public class ArrayOfXMSMessage {

    @XmlElement(name = "XMSMessage", nillable = true)
    protected List<XMSMessage> xmsMessage;

    /**
     * Gets the value of the xmsMessage property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the xmsMessage property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getXMSMessage().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link XMSMessage }
     * 
     * 
     */
    public List<XMSMessage> getXMSMessage() {
        if (xmsMessage == null) {
            xmsMessage = new ArrayList<XMSMessage>();
        }
        return this.xmsMessage;
    }

}
