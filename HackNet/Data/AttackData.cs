﻿using HackNet.Security;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Core;
using System.Linq;
using System.Web;

namespace HackNet.Data
{
    public partial class AttackData
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int AttackId { get; set; }
        [Required]
        public string AttackName { get; set; }
        public string AttackInfo { get; set; }
        public byte[] AttackPic { get; set; }

        public static AttackData GetAttackData(int atkid)
        {
            try
            {
                using(DataContext db=new DataContext())
                {
                    AttackData atkdata = new AttackData();
                    atkdata = (from a in db.AttackData
                               where a.AttackId == atkid
                               select a).FirstOrDefault();
                    return atkdata;
                }
            }
            catch (EntityCommandExecutionException)
            {
                throw new ConnectionException("Database link failure has occured");
            }
        }

        public static List<AttackData> GetAttackDataList()
        {
            try
            {
                using(DataContext db=new DataContext())
                {
                    var query = from a in db.AttackData select a;
                    return query.ToList();
                }
            }
            catch (EntityCommandExecutionException)
            {
                throw new ConnectionException("Database link failure has occured");
            }
        }
    }
}