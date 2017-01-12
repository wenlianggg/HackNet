﻿using HackNet.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace HackNet.Security
{
	public class MessageLogic
	{
		public static List<Message> RetrieveMessages(int Sender, int Receiver, int Viewer, byte[] aesKey)
		{
			List<Message> decryptedMessages = new List<Message>();
			using (DataContext db = new DataContext())
			{
				string ViewerAddr;
				UserKeyStore ViewKS;
				string rsaPrivKey;

				// Get the user's key store
				ViewerAddr = db.Users.Find(Viewer).Email;
				using (Authenticate a = new Authenticate(ViewerAddr))
					ViewKS = a.GetKeyStore(db);

				// Decrypt the RSA key using the AES key
				byte[] rsaKeyBytes = Crypt.Instance.DecryptAes(ViewKS.RsaPriv, aesKey);
				rsaPrivKey = Encoding.UTF8.GetString(rsaKeyBytes);

				// DB Query for messages that match query
				List<Messages> dbMessages = 
					db.Messages.Where(m => m.SenderId == Sender && m.ReceiverId == Receiver).ToList();

				// Convert each message into decrypted form
				foreach(Messages dbMsg in dbMessages)
				{
					decryptedMessages.Add(Message.FromDatabase(dbMsg, Viewer, rsaPrivKey));
				}
			}
			return decryptedMessages;
		}

		public static void SendMessage(Message msg)
		{
			using (DataContext db = new DataContext())
			{
				string SenderEmail, ReceiverEmail;
				UserKeyStore SenderUKS, ReceiverUKS;

				// Get the email address of concerned users
				SenderEmail = db.Users.Find(msg.SenderId).Email;
				ReceiverEmail = db.Users.Find(msg.RecipientId).Email;

				// Get the UserKeyStore object of the users
				using (Authenticate a = new Authenticate(SenderEmail))
					SenderUKS = a.GetKeyStore(db);
				using (Authenticate a = new Authenticate(ReceiverEmail))
					ReceiverUKS = a.GetKeyStore(db);

				// Convert the message to database format while encrypting it
				Messages dbMsg = msg.ToDatabase(ReceiverUKS.RsaPub, SenderUKS.RsaPub);

				// Add to database
				db.Messages.Add(dbMsg);
				db.SaveChanges();
			}
		}
	}
}