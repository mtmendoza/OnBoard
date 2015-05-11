package jspBeans;

public class Notification 
{
	private Messenger sender;
	private Messenger receiver;
	private String message;
	private String title;
	
	public Notification(Messenger sender, Messenger receiver, String message, String title) {
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
		this.title = title;
	}

	public Messenger getSender() {
		return sender;
	}

	public void setSender(Messenger sender) {
		this.sender = sender;
	}

	public Messenger getReceiver() {
		return receiver;
	}

	public void setReceiver(Messenger receiver) {
		this.receiver = receiver;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;;
	}
	
	

}
