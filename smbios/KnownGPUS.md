## 已知GPU列表
```
static struct gma_gpu_t KnownGPUS[] = {
  { 0xFFFF, "Intel Unsupported"              }, // common name for unsuported devices
#if WILL_WORK
  //============== PowerVR ===================
  //--------Canmore/Sodaville/Groveland-------
  { 0x2E5B, "Intel 500"                      }, //

  //----------------Poulsbo-------------------
  { 0x8108, "Intel 500"                      }, // Menlow
  { 0x8109, "Intel 500"                      }, // Menlow

  //----------------Lincroft------------------
  { 0x4102, "Intel 600"                      }, // Moorestown

  //----------------Cedarview-----------------
  { 0x0BE0, "Intel GMA 3600"                 }, // Cedar Trail
  { 0x0BE1, "Intel GMA 3600"                 }, // Cedar Trail
  { 0x0BE2, "Intel GMA 3650"                 }, // Cedar Trail
  { 0x0BE3, "Intel GMA 3650"                 }, // Cedar Trail

  //----------------Cloverview----------------
  { 0x08C7, "Intel GMA"                      }, // Clover Trail
  { 0x08C8, "Intel GMA"                      }, // Clover Trail
  { 0x08C9, "Intel GMA"                      }, // Clover Trail
  { 0x08CA, "Intel GMA"                      }, // Clover Trail
  { 0x08CB, "Intel GMA"                      }, // Clover Trail
  { 0x08CC, "Intel GMA"                      }, // Clover Trail
  { 0x08CD, "Intel GMA"                      }, // Clover Trail
  { 0x08CE, "Intel GMA"                      }, // Clover Trail
  { 0x08CF, "Intel GMA"                      }, // Clover Trail


  //============== 1st generation ============
  //----------------Auburn--------------------
  { 0x7800, "Intel 740"                      }, // Desktop - Intel 740 GMCH Express Chipset Family

  //----------------Portola-------------------
  { 0x1240, "Intel 752"                      }, // Desktop - Intel 752 GMCH Express Chipset Family

  //----------------Whitney-------------------
  { 0x7121, "Intel 3D graphics 810"          }, // Desktop - Intel 810 GMCH Express Chipset Family
  { 0x7123, "Intel 3D graphics 810"          }, // Desktop - Intel 810-DC100 GMCH Express Chipset Family
  { 0x7125, "Intel 3D graphics 810"          }, // Desktop - Intel 810E GMCH Express Chipset Family

  //----------------Solano--------------------
  { 0x1132, "Intel 3D graphics 815"          }, // Desktop - Intel 815 GMCH Express Chipset Family


  //============== 2nd generation ============
  //----------------Almador-------------------
  { 0x3577, "Intel Extreme Graphics 830"     }, // Mobile - Intel 830M GMCH Express Chipset Family
  { 0x357B, "Intel Extreme Graphics 835"     }, // Desktop - Intel 835G GMCH Express Chipset Family

  //----------------Brookdale-----------------
  { 0x2562, "Intel Extreme Graphics 845"     }, // Desktop - Intel 845G GMCH Express Chipset Family

  //----------------Montara-------------------
  { 0x358E, "Intel Extreme Graphics 2 854"   }, // Mobile - Intel 852GM/855GM GMCH Express Chipset Family
  { 0x3582, "Intel Extreme Graphics 2 855"   }, // Mobile - Intel 852GM/855GM GMCH Express Chipset Family

  //----------------Springdale----------------
  { 0x2572, "Intel Extreme Graphics 2 865"   }, // Desktop - Intel 865G Express Chipset Family


  //============== 3rd generation ============
  //----------------Grantsdale----------------
  { 0x2582, "Intel GMA 900"                  }, // Desktop - Intel 915G Express Chipset Family
  { 0x258A, "Intel GMA 900"                  }, // Desktop - Intel 915GM Express Chipset Family
  { 0x2782, "Intel GMA 900"                  }, // Desktop - Intel 915GV Express Chipset Family

  //----------------Alviso--------------------
  { 0x2592, "Intel GMA 900"                  }, // Mobile - Intel 82915GM/GMS, 910GML Express Chipset Family
  { 0x2792, "Intel GMA 900"                  }, // Mobile - Intel 82915GM/GMS, 910GML Express Chipset Family
#endif
  //----------------Lakeport------------------
  { 0x2772, "Intel GMA 950"                  }, // Desktop - Intel 82945G Express Chipset Family
  { 0x2776, "Intel GMA 950"                  }, // Desktop - Intel 82945G Express Chipset Family

  //----------------Calistoga-----------------
  { 0x27A2, "Intel GMA 950"                  }, // Mobile - Intel 945GM Express Chipset Family - MacBook1,1/MacBook2,1
  { 0x27A6, "Intel GMA 950"                  }, // Mobile - Intel 945GM Express Chipset Family
  { 0x27AE, "Intel GMA 950"                  }, // Mobile - Intel 945GM Express Chipset Family
#if WILL_WORK
  //----------------Bearlake------------------
  { 0x29B2, "Intel GMA 3100"                 }, // Desktop - Intel Q35 Express Chipset Family
  { 0x29B3, "Intel GMA 3100"                 }, // Desktop - Intel Q35 Express Chipset Family
  { 0x29C2, "Intel GMA 3100"                 }, // Desktop - Intel G33/G31 Express Chipset Family
  { 0x29C3, "Intel GMA 3100"                 }, // Desktop - Intel G33/G31 Express Chipset Family
  { 0x29D2, "Intel GMA 3100"                 }, // Desktop - Intel Q33 Express Chipset Family
  { 0x29D3, "Intel GMA 3100"                 }, // Desktop - Intel Q33 Express Chipset Family

  //----------------Pineview------------------
  { 0xA001, "Intel GMA 3150"                 }, // Nettop - Intel NetTop Atom D410
  { 0xA002, "Intel GMA 3150"                 }, // Nettop - Intel NetTop Atom D510
  { 0xA011, "Intel GMA 3150"                 }, // Netbook - Intel NetBook Atom N4x0
  { 0xA012, "Intel GMA 3150"                 }, // Netbook - Intel NetBook Atom N4x0


  //============== 4th generation ============
  //----------------Lakeport------------------
  { 0x2972, "Intel GMA 3000"                 }, // Desktop - Intel 946GZ Express Chipset Family
  { 0x2973, "Intel GMA 3000"                 }, // Desktop - Intel 946GZ Express Chipset Family

  //----------------Broadwater----------------
  { 0x2992, "Intel GMA 3000"                 }, // Desktop - Intel Q965/Q963 Express Chipset Family
  { 0x2993, "Intel GMA 3000"                 }, // Desktop - Intel Q965/Q963 Express Chipset Family
  { 0x29A2, "Intel GMA X3000"                }, // Desktop - Intel G965 Express Chipset Family
  { 0x29A3, "Intel GMA X3000"                }, // Desktop - Intel G965 Express Chipset Family
#endif
  //----------------Crestline-----------------
  { 0x2A02, "Intel GMA X3100"                }, // Mobile - Intel 965 Express Chipset Family - MacBook3,1/MacBook4,1/MacbookAir1,1
  { 0x2A03, "Intel GMA X3100"                }, // Mobile - Intel 965 Express Chipset Family
  { 0x2A12, "Intel GMA X3100"                }, // Mobile - Intel 965 Express Chipset Family
  { 0x2A13, "Intel GMA X3100"                }, // Mobile - Intel 965 Express Chipset Family
#if WILL_WORK
  //----------------Bearlake------------------
  { 0x2982, "Intel GMA X3500"                }, // Desktop - Intel G35 Express Chipset Family
  { 0x2983, "Intel GMA X3500"                }, // Desktop - Intel G35 Express Chipset Family

  //----------------Eaglelake-----------------
  { 0x2E02, "Intel GMA 4500"                 }, // Desktop - Intel 4 Series Express Chipset Family
  { 0x2E03, "Intel GMA 4500"                 }, // Desktop - Intel 4 Series Express Chipset Family
  { 0x2E12, "Intel GMA 4500"                 }, // Desktop - Intel G45/G43 Express Chipset Family
  { 0x2E13, "Intel GMA 4500"                 }, // Desktop - Intel G45/G43 Express Chipset Family
  { 0x2E42, "Intel GMA 4500"                 }, // Desktop - Intel B43 Express Chipset Family
  { 0x2E43, "Intel GMA 4500"                 }, // Desktop - Intel B43 Express Chipset Family
  { 0x2E92, "Intel GMA 4500"                 }, // Desktop - Intel B43 Express Chipset Family
  { 0x2E93, "Intel GMA 4500"                 }, // Desktop - Intel B43 Express Chipset Family
  { 0x2E32, "Intel GMA X4500"                }, // Desktop - Intel G45/G43 Express Chipset Family
  { 0x2E33, "Intel GMA X4500"                }, // Desktop - Intel G45/G43 Express Chipset Family
  { 0x2E22, "Intel GMA X4500"                }, // Mobile - Intel G45/G43 Express Chipset Family
  { 0x2E23, "Intel GMA X4500HD"              }, // Mobile - Intel G45/G43 Express Chipset Family

  //----------------Cantiga-------------------
  { 0x2A42, "Intel GMA X4500MHD"             }, // Mobile - Intel 4 Series Express Chipset Family
  { 0x2A43, "Intel GMA X4500MHD"             }, // Mobile - Intel 4 Series Express Chipset Family

#endif
  //============== 5th generation ============
  //----------------Ironlake------------------
  { 0x0042, "Intel HD Graphics"              }, // Desktop - Clarkdale
  { 0x0046, "Intel HD Graphics"              }, // Mobile - Arrandale - MacBookPro6,x


  //============== 6th generation ============
  //----------------Sandy Bridge--------------
  //GT1
  { 0x0102, "Intel HD Graphics 2000"         }, // Desktop - iMac12,x
  { 0x0106, "Intel HD Graphics 2000"         }, // Mobile
  { 0x010A, "Intel HD Graphics P3000"        }, // Server
  //GT2
  { 0x0112, "Intel HD Graphics 3000"         }, // Desktop
  { 0x0116, "Intel HD Graphics 3000"         }, // Mobile - MacBookAir4,x/MacBookPro8,2/MacBookPro8,3
  { 0x0122, "Intel HD Graphics 3000"         }, // Desktop
  { 0x0126, "Intel HD Graphics 3000"         }, // Mobile - MacBookPro8,1/Macmini5,x


  //============== 7th generation ============
  //----------------Ivy Bridge----------------
  //GT1
  { 0x0152, "Intel HD Graphics 2500"         }, // Desktop - iMac13,x
  { 0x0156, "Intel HD Graphics 2500"         }, // Mobile
  { 0x015A, "Intel HD Graphics 2500"         }, // Server
  { 0x015E, "Intel Ivy Bridge GT1"           }, // Reserved
  //GT2
  { 0x0162, "Intel HD Graphics 4000"         }, // Desktop
  { 0x0166, "Intel HD Graphics 4000"         }, // Mobile - MacBookPro9,x/MacBookPro10,x/MacBookAir5,x/Macmini6,x
  { 0x016A, "Intel HD Graphics P4000"        }, // Server

  //----------------Haswell-------------------
  //GT1
  { 0x0402, "Intel Haswell GT1"              }, // Desktop
  { 0x0406, "Intel Haswell GT1"              }, // Mobile
  { 0x040A, "Intel Haswell GT1"              }, // Server
  { 0x040B, "Intel Haswell GT1"              }, //
  { 0x040E, "Intel Haswell GT1"              }, //
  //GT2
  { 0x0412, "Intel HD Graphics 4600"         }, // Desktop - iMac15,1
  { 0x0416, "Intel HD Graphics 4600"         }, // Mobile
  { 0x041A, "Intel HD Graphics P4600"        }, // Server
  { 0x041B, "Intel Haswell GT2"              }, //
  { 0x041E, "Intel HD Graphics 4400"         }, //
  //GT3
  { 0x0422, "Intel HD Graphics 5000"         }, // Desktop
  { 0x0426, "Intel HD Graphics 5000"         }, // Mobile
  { 0x042A, "Intel HD Graphics 5000"         }, // Server
  { 0x042B, "Intel Haswell GT3"              }, //
  { 0x042E, "Intel Haswell GT3"              }, //
  //GT1
  { 0x0A02, "Intel Haswell GT1"              }, // Desktop ULT
  { 0x0A06, "Intel HD Graphics"              }, // Mobile ULT
  { 0x0A0A, "Intel Haswell GT1"              }, // Server ULT
  { 0x0A0B, "Intel Haswell GT1"              }, // ULT
  { 0x0A0E, "Intel Haswell GT1"              }, // ULT
  //GT2
  { 0x0A12, "Intel Haswell GT2"              }, // Desktop ULT
  { 0x0A16, "Intel HD Graphics 4400"         }, // Mobile ULT
  { 0x0A1A, "Intel Haswell GT2"              }, // Server ULT
  { 0x0A1B, "Intel Haswell GT2"              }, // ULT
  { 0x0A1E, "Intel HD Graphics 4200"         }, // ULT
  //GT3
  { 0x0A22, "Intel Iris Graphics 5100"       }, // Desktop ULT
  { 0x0A26, "Intel HD Graphics 5000"         }, // Mobile ULT - MacBookAir6,x/Macmini7,1
  { 0x0A2A, "Intel Iris Graphics 5100"       }, // Server ULT
  { 0x0A2B, "Intel Iris Graphics 5100"       }, // ULT
  { 0x0A2E, "Intel Iris Graphics 5100"       }, // ULT - MacBookPro11,1
  //GT1
  { 0x0C02, "Intel Haswell GT1"              }, // Desktop SDV
  { 0x0C06, "Intel Haswell GT1"              }, // Mobile SDV
  { 0x0C0A, "Intel Haswell GT1"              }, // Server SDV
  { 0x0C0B, "Intel Haswell GT1"              }, // SDV
  { 0x0C0E, "Intel Haswell GT1"              }, // SDV
  //GT2
  { 0x0C12, "Intel Haswell GT2"              }, // Desktop SDV
  { 0x0C16, "Intel Haswell GT2"              }, // Mobile SDV
  { 0x0C1A, "Intel Haswell GT2"              }, // Server SDV
  { 0x0C1B, "Intel Haswell GT2"              }, // SDV
  { 0x0C1E, "Intel Haswell GT2"              }, // SDV
  //GT3
  { 0x0C22, "Intel Haswell GT3"              }, // Desktop SDV
  { 0x0C26, "Intel Haswell GT3"              }, // Mobile SDV
  { 0x0C2A, "Intel Haswell GT3"              }, // Server SDV
  { 0x0C2B, "Intel Haswell GT3"              }, // SDV
  { 0x0C2E, "Intel Haswell GT3"              }, // SDV
  //GT1
  { 0x0D02, "Intel Haswell GT1"              }, // Desktop CRW
  { 0x0D06, "Intel Haswell GT1"              }, // Mobile CRW
  { 0x0D0A, "Intel Haswell GT1"              }, // Server CRW
  { 0x0D0B, "Intel Haswell GT1"              }, // CRW
  { 0x0D0E, "Intel Haswell GT1"              }, // CRW
  //GT2
  { 0x0D12, "Intel HD Graphics 4600"         }, // Desktop CRW
  { 0x0D16, "Intel HD Graphics 4600"         }, // Mobile CRW
  { 0x0D1A, "Intel Haswell GT2"              }, // Server CRW
  { 0x0D1B, "Intel Haswell GT2"              }, // CRW
  { 0x0D1E, "Intel Haswell GT2"              }, // CRW
  //GT3
  { 0x0D22, "Intel Iris Pro Graphics 5200"   }, // Desktop CRW - iMac14,1/iMac14,4
  { 0x0D26, "Intel Iris Pro Graphics 5200"   }, // Mobile CRW - MacBookPro11,2/MacBookPro11,3
  { 0x0D2A, "Intel Iris Pro Graphics 5200"   }, // Server CRW
  { 0x0D2B, "Intel Iris Pro Graphics 5200"   }, // CRW
  { 0x0D2E, "Intel Iris Pro Graphics 5200"   }, // CRW

  //----------------ValleyView----------------
  { 0x0F30, "Intel HD Graphics"              }, // Bay Trail
  { 0x0F31, "Intel HD Graphics"              }, // Bay Trail
  { 0x0F32, "Intel HD Graphics"              }, // Bay Trail
  { 0x0F33, "Intel HD Graphics"              }, // Bay Trail
  { 0x0155, "Intel HD Graphics"              }, // Bay Trail
  { 0x0157, "Intel HD Graphics"              }, // Bay Trail


  //============== 8th generation ============
  //----------------Broadwell-----------------
  //GT1
  { 0x1602, "Intel Broadwell GT1"            }, // Desktop
  { 0x1606, "Intel Broadwell GT1"            }, // Mobile
  { 0x160A, "Intel Broadwell GT1"            }, //
  { 0x160B, "Intel Broadwell GT1"            }, //
  { 0x160D, "Intel Broadwell GT1"            }, //
  { 0x160E, "Intel Broadwell GT1"            }, //
  //GT2
  { 0x1612, "Intel HD Graphics 5600"         }, // Mobile
  { 0x1616, "Intel HD Graphics 5500"         }, // Mobile
  { 0x161A, "Intel Broadwell GT2"            }, //
  { 0x161B, "Intel Broadwell GT2"            }, //
  { 0x161D, "Intel Broadwell GT2"            }, //
  { 0x161E, "Intel HD Graphics 5300"         }, // Ultramobile - MacBook8,1
  //GT3
  { 0x1626, "Intel HD Graphics 6000"         }, // Mobile - iMac16,1/MacBookAir7,x
  { 0x162B, "Intel Iris Graphics 6100"       }, // Mobile - MacBookPro12,1
  { 0x162D, "Intel Iris Pro Graphics P6300"  }, // Workstation, Mobile Workstation
  //GT3e
  { 0x1622, "Intel Iris Pro Graphics 6200"   }, // Desktop, Mobile - iMac16,2
  { 0x162A, "Intel Iris Pro Graphics P6300"  }, // Workstation
  //RSVD
  { 0x162E, "Intel Broadwell RSVD"           }, // Reserved
  { 0x1632, "Intel Broadwell RSVD"           }, // Reserved
  { 0x1636, "Intel Broadwell RSVD"           }, // Reserved
  { 0x163A, "Intel Broadwell RSVD"           }, // Reserved
  { 0x163B, "Intel Broadwell RSVD"           }, // Reserved
  { 0x163D, "Intel Broadwell RSVD"           }, // Reserved
  { 0x163E, "Intel Broadwell RSVD"           }, // Reserved

  //------------Cherryview/Braswell-----------
  { 0x22B0, "Intel HD Graphics 400"          }, // Cherry Trail - Atom x5 series - Z83X0/Z8550
  { 0x22B1, "Intel HD Graphics 405"          }, // Cherry Trail - Atom x7 series - Z8750
  { 0x22B2, "Intel HD Graphics 400"          }, // Braswell - Cerelon QC/DC series - X3X60
  { 0x22B3, "Intel HD Graphics 405"          }, // Braswell - Pentium QC series - X3710


  //============== 9th generation ============
  //----------------Skylake-------------------
  //GT1
  { 0x1902, "Intel HD Graphics 510"          }, // Desktop
  { 0x1906, "Intel HD Graphics 510"          }, // Mobile
  { 0x190A, "Intel Skylake GT1"              }, //
  { 0x190B, "Intel HD Graphics 510"          }, //
  { 0x190E, "Intel Skylake GT1"              }, //
  //GT2
  { 0x1912, "Intel HD Graphics 530"          }, // Desktop - iMac17,1
  { 0x1916, "Intel HD Graphics 520"          }, // Mobile
  { 0x191A, "Intel Skylake GT2"              }, //
  { 0x191B, "Intel HD Graphics 530"          }, // Mobile - MacBookPro13,3
  { 0x191D, "Intel HD Graphics P530"         }, // Workstation, Mobile Workstation
  { 0x191E, "Intel HD Graphics 515"          }, // Mobile - MacBook9,1
  { 0x1921, "Intel HD Graphics 520"          }, //
  //GT2f
  { 0x1913, "Intel Skylake GT2f"             }, //
  { 0x1915, "Intel Skylake GT2f"             }, //
  { 0x1917, "Intel Skylake GT2f"             }, //
  //GT3
  { 0x1923, "Intel HD Graphics 535"          }, //
  //GT3e
  { 0x1926, "Intel Iris Graphics 540"        }, // Mobile - MacBookPro13,1
  { 0x1927, "Intel Iris Graphics 550"        }, // Mobile - MacBookPro13,2
  { 0x192B, "Intel Iris Graphics 555"        }, //
  { 0x192D, "Intel Iris Graphics P555"       }, // Workstation
  //GT4
  { 0x192A, "Intel Skylake GT4"              }, //
  //GT4e
  { 0x1932, "Intel Iris Pro Graphics 580"    }, // Desktop
  { 0x193A, "Intel Iris Pro Graphics P580"   }, // Server
  { 0x193B, "Intel Iris Pro Graphics 580"    }, // Mobile
  { 0x193D, "Intel Iris Pro Graphics P580"   }, // Workstation, Mobile Workstation

  //----------------Goldmont------------------
  { 0x0A84, "Intel HD Graphics"              }, // Broxton(cancelled)
  { 0x1A84, "Intel HD Graphics"              }, // Broxton(cancelled)
  { 0x1A85, "Intel HD Graphics"              }, // Broxton(cancelled)
  { 0x5A84, "Intel HD Graphics 505"          }, // Apollo Lake
  { 0x5A85, "Intel HD Graphics 500"          }, // Apollo Lake

  //----------------Kaby Lake-----------------
  //GT1
  { 0x5902, "Intel HD Graphics 610"          }, // Desktop
  { 0x5906, "Intel HD Graphics 610"          }, // Mobile
  { 0x5908, "Intel Kaby Lake GT1"            }, //
  { 0x590A, "Intel Kaby Lake GT1"            }, //
  { 0x590B, "Intel Kaby Lake GT1"            }, //
  { 0x590E, "Intel Kaby Lake GT1"            }, //
  //GT1.5
  { 0x5913, "Intel Kaby Lake GT1.5"          }, //
  { 0x5915, "Intel Kaby Lake GT1.5"          }, //
  //GT2
  { 0x5912, "Intel HD Graphics 630"          }, // Desktop - iMac18,2/iMac18,3
  { 0x5916, "Intel HD Graphics 620"          }, // Mobile
  { 0x591A, "Intel HD Graphics P630"         }, // Server
  { 0x591B, "Intel HD Graphics 630"          }, // Mobile - MacBookPro14,3
  { 0x591D, "Intel HD Graphics P630"         }, // Workstation, Mobile Workstation
  { 0x591E, "Intel HD Graphics 615"          }, // Mobile - MacBook10,1
  //GT2F
  { 0x5921, "Intel Kaby Lake GT2F"           }, //
  //GT3
  { 0x5923, "Intel HD Graphics 635"          }, //
  { 0x5926, "Intel Iris Plus Graphics 640"   }, // Mobile - MacBookPro14,1/iMac18,1
  { 0x5927, "Intel Iris Plus Graphics 650"   }, // Mobile - MacBookPro14,2
  //GT4
  { 0x593B, "Intel Kaby Lake GT4"            }, //

  //-------------Kaby Lake Refresh------------
  //GT1.5
  { 0x5917, "Intel UHD Graphics 620"         }, // Mobile

  //----------------Amber Lake----------------
  //GT2
  { 0x591C, "Intel UHD Graphics 615"         }, // Kaby Lake
  { 0x87C0, "Intel UHD Graphics 617"         }, // Kaby Lake - Mobile - MacBookAir8,1
  { 0x87CA, "Intel UHD Graphics 615"         }, // Comet Lake

  //----------------Coffee Lake---------------
  //GT1
  { 0x3E90, "Intel UHD Graphics 610"         }, // Desktop
  { 0x3E93, "Intel UHD Graphics 610"         }, // Desktop
  { 0x3E99, "Intel Coffee Lake GT1"          }, //
  //GT2
  { 0x3E91, "Intel UHD Graphics 630"         }, // Desktop
  { 0x3E92, "Intel UHD Graphics 630"         }, // Desktop
  { 0x3E94, "Intel Coffee Lake GT2"          }, //
  { 0x3E96, "Intel Coffee Lake GT2"          }, //
  { 0x3E98, "Intel UHD Graphics 630"         }, // Desktop
  { 0x3E9A, "Intel Coffee Lake GT2"          }, //
  { 0x3E9B, "Intel UHD Graphics 630"         }, // Mobile - MacBookPro15,1/Macmini8,1
  { 0x3EA9, "Intel Coffee Lake GT2"          }, //
  //GT3
  { 0x3EA5, "Intel Iris Plus Graphics 655"   }, // Mobile - MacBookPro15,2
  { 0x3EA6, "Intel Coffee Lake GT3"          }, //
  { 0x3EA7, "Intel Coffee Lake GT3"          }, //
  { 0x3EA8, "Intel Coffee Lake GT3"          }, //

  //----------------Whiskey Lake--------------
  //GT1
  { 0x3EA1, "Intel Whiskey Lake GT1"         }, //
  { 0x3EA4, "Intel Whiskey Lake GT1"         }, //
  //GT2
  { 0x3EA0, "Intel UHD Graphics 620"         }, // Mobile
  { 0x3EA3, "Intel Whiskey Lake GT2"         }, //
  //GT3
  { 0x3EA2, "Intel Whiskey Lake GT3"         }, //

  //----------------Comet Lake----------------
  //GT1
  { 0x9B21, "Intel Comet Lake GT1"           }, //
  { 0x9BA0, "Intel Comet Lake GT1"           }, //
  { 0x9BA2, "Intel Comet Lake GT1"           }, //
  { 0x9BA4, "Intel Comet Lake GT1"           }, //
  { 0x9BA5, "Intel Comet Lake GT1"           }, //
  { 0x9BA8, "Intel Comet Lake GT1"           }, //
  { 0x9BAA, "Intel Comet Lake GT1"           }, //
  { 0x9BAB, "Intel Comet Lake GT1"           }, //
  { 0x9BAC, "Intel Comet Lake GT1"           }, //
  //GT2
  { 0x9B41, "Intel UHD Graphics 620"         }, // Mobile
  { 0x9BC0, "Intel Comet Lake GT2"           }, //
  { 0x9BC2, "Intel Comet Lake GT2"           }, //
  { 0x9BC4, "Intel Comet Lake GT2"           }, //
  { 0x9BC5, "Intel Comet Lake GT2"           }, //
  { 0x9BC8, "Intel Comet Lake GT2"           }, //
  { 0x9BCA, "Intel UHD Graphics 620"         }, // Mobile
  { 0x9BCB, "Intel Comet Lake GT2"           }, //
  { 0x9BCC, "Intel Comet Lake GT2"           }, //

  //----------------Gemini Lake---------------
  { 0x3184, "Intel UHD Graphics 605"         }, //
  { 0x3185, "Intel UHD Graphics 600"         }, //


  //============== 10th generation ===========
  //----------------Cannonlake----------------
  //GTx
  { 0x5A40, "Intel Cannonlake GTx"           }, //
  //GT0.5
  { 0x5A49, "Intel Cannonlake GT0.5"         }, //
  { 0x5A4A, "Intel Cannonlake GT0.5"         }, //
  //GT1
  { 0x0A01, "Intel Cannonlake GT1"           }, // Desktop
  { 0x5A41, "Intel Cannonlake GT1"           }, //
  { 0x5A42, "Intel Cannonlake GT1"           }, //
  { 0x5A44, "Intel Cannonlake GT1"           }, //
  //GT1.5
  { 0x5A59, "Intel Cannonlake GT1.5"         }, //
  { 0x5A5A, "Intel Cannonlake GT1.5"         }, //
  { 0x5A5C, "Intel Cannonlake GT1.5"         }, //
  //GT2
  { 0x5A50, "Intel Cannonlake GT2"           }, //
  { 0x5A51, "Intel Cannonlake GT2"           }, //
  { 0x5A52, "Intel Cannonlake GT2"           }, // Mobile
  { 0x5A54, "Intel Cannonlake GT2"           }, // Mobile


  //============== 11th generation ===========
  //----------------Ice Lake------------------
  //GT0.5
  { 0x8A71, "Intel Ice Lake GT0.5"           }, //
  //GT1
  { 0x8A5B, "Intel Ice Lake GT1"             }, //
  { 0x8A5D, "Intel Ice Lake GT1"             }, //
  //GT1.5
  { 0x8A5A, "Intel Ice Lake GT1.5"           }, //
  { 0x8A5C, "Intel Ice Lake GT1.5"           }, //
  //GT2
  { 0x8A50, "Intel Ice Lake GT2"             }, //
  { 0x8A51, "Intel Ice Lake GT2"             }, //
  { 0x8A52, "Intel Ice Lake GT2"             }, //

  //----------------Lakefield-----------------
  { 0x9840, "Intel Lakefield"                }, //
  { 0x9850, "Intel Lakefield"                }, //

  //----------------Jasper Lake---------------
  { 0x4500, "Intel Jasper Lake"              }, //

};
```
> [@daliansky](http://blog.daliansky.net/Intel-core-display-platformID-finishing.html) 某些SKL/KBL台式机如果驱动4K显示器可以试试 platform-id:0x193b0005 这个ig-platform-id不存在于gma.c列表里