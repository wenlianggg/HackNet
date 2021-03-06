﻿using HackNet.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace HackNet.Loggers
{
	public static class MissionLogLogic
	{
		public static void Store(int userid, string missionName, bool result, List<string> rewards = null)
		{
			JsonSerializer js = new JsonSerializer();

			if (rewards == null)
				rewards = new List<string>();

            if (result == true)
                GameLogger.Instance.MissionSuccess(missionName, string.Join(",", rewards.ToArray()));
            else
                GameLogger.Instance.MissionFail(missionName);

			using (DataContext db = new DataContext())
			{
				MissionLog ml = new MissionLog()
				{
					MissionName = missionName,
					Rewards = JsonConvert.SerializeObject(rewards),
					Timestamp = DateTime.Now,
					Successful = result,
					UserId = userid
				};

      			db.MissionLog.Add(ml);
				db.SaveChanges();
			}
		}

        public static IList<string> DeserializeRewards(string dbinput)
        {
            List<string> liststr;

            if (dbinput == null) {
                liststr = new List<string>();
                return liststr;
            } else {
                liststr = JsonConvert.DeserializeObject<List<string>>(dbinput);
            }

            return liststr;
        }

        public static IList<MissionLog> Get(int id)
        {
            List<MissionLog> ml;

            using (DataContext db = new DataContext())
            {
                ml = db.MissionLog.Where(m => m.UserId == id).ToList();
            }

            return ml;
        }
	}
}