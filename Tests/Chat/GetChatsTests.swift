import XCTest
import Push

class GetChatsTests: XCTestCase {

  // func testGetChatsSuccessfully() async throws {
  //   let chats = try await Push.Chats.getChats(options: GetChatsOptions(
  //     account: "0xACEe0D180d0118FD4F3027Ab801cc862520570d1",
  //     pgpPrivateKey: "{\n        \"ciphertext\": \"99f06e39e7fecdc4777c5373efe939cecf2956d915a9aceb2a5bb4c2d69932956e14d2c6db67966fc2e17ccc1bdb43cc0751e5c0ef355627d27a50bd1b31fb87f5fb27ea9d3a2aba17cfe0bfd18e30d4c575dbccdba2775dc893e48240145383bee8fe6673086a134eaf8da1f7ec22c4a25767b3b171c5b5d814d8ee4761a4fc7e1d51d7bc38e27e93dd8e8711740c781fb407e8a5df2c3c0f37ce976972f768036201713fadbc113ac244f6a719c6ad797def325c817e3af145e59c5bf9c610903d289044e6d676bfa604ccb4e249d0af9e1afe02b62fb4f623446225a6edc73ab6ee1c6ad75d8937aef4d5af04cb035d5090dd4e7d7b0b7db037c8971510e9c6e0b6795e241fc21ddcc8355d5e7bdf8b5b01d48a77d64d4a5bee130a4b9324a5da32a900e8f85566b24158d59006cf1f228da412d26fa59a5343430fdf497a2c85f94c5fc314b2efb9c45ccab711636bcffb5771e3b2816c54a8c7d3ed92db535093ba2db149ffabba4d3effbd1d6e9e6acda2eefb884f1e99f02864c1ac668058867a5af79e265726d37b2ee272f8b5276c44b2c837cddfa03ecde548477570d4bd5ecc9b5825b06145b802d3ba85e49d5eca81ab9ee0e08245ec629634b0226661ad2b62d6c3156ed114c9b4ad35d82cb7febbaf75e66778249ea83235efc4816d4455d86f32719524b59f113102e1ef7a0f66ef7eb11afd9fd3fc626273621280dee45b67fb3b3a5dfbf934f877dbb38ebe70b01ba10727fa7985f89dbeec005f0a0d6b007fde653dd228263570cbf46f7ae81ac0a67fa2bec3cb8c6de7a7426ec7e3d8b9172b2bc7c31526f101e62dcd169ee2424d4418b9c765373cf99a2980790b3869c84cc339770eac51613b9adb9a6f939238ede4d3c9f7f45b910beb9ffbc9089ed3d038dd3347c9a6894a7ab69645f0825d5119f827832ab4c8c9cdcea260656cc912c423175f50ef30751dbfdda9180d121521f46288392511fb43539990feecf74381f33b687c6653a31438d3b65e4a9e7efec69a406fec841f0e319ff5b7fe6d2122af873e9f0ea25b7ee0be97b9198413dc26f4cec230a8c1296879e8a2e17d6b509517878d163d95d3d31da25f915d50b33a178abd879a46654415afdc0b680562a9a16bffb4d4259e80a8ef12e624b7c4139a94d5fb0a2efbabb431ea20735d3896bbdb4bf265b3e1a73238d1574bf250100d02acc1306541590b7cbabfcdc92296fc0cb334f1f7060d4074f391ac2ce1eabead86cff8e24c1c5f4b183e29f0976d2d7c1bb88ac12d077d89093d981b6ab5fd31843be629b5e78229b9cf0b8842dcfc979bdb59087e8fee81a4a1d3b62603d373350a0845a4eb1f005c4dc40e57e60eec51b3b22cc29f89faf27fbf04ccd977d1a2b6ab8281e289daa4cf547e6b4cc162809da1af38112bfd8dad49dcce8629848d37f6149bb506104cc4cf95692e0d51c7a2870be00cadf012207c728c8671e5b873a0e018cb356b9f7eaf1dd396a2113904db1d1b8d7cac7138e20c45a224f5dec3d35c52936c600e020a4da48e1c46ac61e70e94bf0f1e3895b10ac3733e340533b01a7efacf18b55b1dc952cd8329e2bdeea66a040f9cdef6654661bcbcd7757a5c77fbe01f5c954fc39b24094c753e44b52f4eedf327db37519aae2c243719fbe5697b1a5a10d14865788d576144415567cc4f0dcaeaa52f3c285f65ff5a1bb76f048ab23ff765cd47cb07922440ff5eaae1e61ced6fe8b8198cc80cae87f113c8f9a24a3f3e3835876fa7f999a711c22745fea570811c21d66c01983d9a0f89142fe9fd69875871a9d91ccdcd32b19fa9fb077a5ec31a857e1880430a1aeca371816a7a19f01bae68de3cc8c2ed5ee67b7c5fd27ee65ee405f25c51bf57d807314b44c3abce86a42d1827affc6d4d95618cec0366b15fb07fa3e000d8cbceb01e0cfef3060f98cfd5e5fa111f35b3bafeb0bb47791d95e572c58309f80562c2a80473c338671247aae385702f92355135241d7248b33fa6c1326fcd05f26a722712d90af569a3e6b265205cc25125a4085ed86c3ed9ea48f1dbde2ec327f98be95c70393a6af764dba1910d843c4b9e1171402c547838b16defafd74783b066fe06aaaeb2836348a460ca5371a17e850ccd35e180ece2ffb0eee284bef955b1989826bbbe5cde04a2f032f9dc11896c19d602b3aae63b9eb6cae7073115d11503dc25b89f9167c4c36dfb9d7ba0683a9396d1b27284aaaaa5835314a9b038ceaf0039a21be1a0b0709f29ede0f44730be8eb6eac41a2f4eb58f1ae18e8670091de415e7c04d0c05285328bfb309a65fc8fe06796f0dcfd191a3226378b92f79cde656f88a71af294f0f205e91dd56e45eeef126f9a013103ba799307358f5d6685476f3ad6ff98d6a1fb4b2d72914a34bb2eac020518c379de6c0a813bdc8e18c5c56cd9f53c938e719e51e9597082454a46b2b46e836f6adf57684c1eadadef4e90cb156122db0dfc6f5ed5ce01ccbc3b6a2b74d52d09e0af973c04c357ba9a387105e639ced15537877df40137ae25ebc02233ed884cf68cd4b28e2e06e0131a5f1c9e233a58b494f6cee1260728279e13c99f5d2183a39c02f8787b9581198f1a5069d7ed02e842b81cc2025e40f2582454805c6f96e44a46a76d304ce267c7026bce74d65b7ed81123e315c51b4e9c3d61b9af52dace5823baac8cb913815717c1c9765b2c10cd2e0b570e018964643e6dede0bc035af8e73ab60cb1248e7cc5304ff0dc65a6c0c45c92585074161373437435a69ad2f1fe2b8be37b8c32ccbb26ff4e22e8e24f31d35ddfc32badc12081221735b55dc90236c93b7f2a8ec8817c079b3121ec6f06b7ca3dcf01ae5938149ae4162230f7e428eb1392b3578d59285700bac6735c5fbd6dc70542f3215cdcbf77ea4a3f41748af082bbf074d700471e2495c5449af96ef1db141a8eafa03466f1bfdce21c95ba24e1f03ef136925a3129932570b31366dae60d8d543cc6832f1de8f6f708257be28402de804bb79a81b004863c73ca766143f2394ddef4d62d67c3cafeaf58c81035da6ec43e1049beeaaa22054fa2832692d81aa55a8857fc22e81eb05cf861e1777ba8256669d5eabd0eddd1745f9b5dab1804b94c002fd32a05ed6896c2bc235368a4c0b981650315e021fea517f442d12c4232e3d30793b172972fbbdcc3e23b0dbe23ee30665bb40eaedf8180ddd27507835ddc0b98ab82ef2676fbe1dbdd7855c6f48582e23c94d0612d736a984856c4e9ec4298e07fe58f64795c709d00a38219657acec396a48c48442ed3d3cbb87abc6ee60c50bc864d912e5792221a9739f8c3b06eba09b6bdd7efe422f822544a096e95fa35c0e881f873b8d370ca2297af416aa6ecbbf6f8fab55822e665ddf493e65bf1336959c941c9ae032adc4a804c8f2fee194dec760d2ff03426c880e833de4a9f2dc456aee4abb8528a49f8f2f64af1e9898cdd7ba9b619aa0e858a3286ad245a8add5512e1e731bcbec3429c13f6313ead67d02bcd4fac53332eb4681e6a4c482873f0116601ca0b44d50d872e5f1b03d3deab18cab6e5ba1ccc15e95aa8a1768694d7523cb49a48b98cc39bb171084bc8af74f3c5e3f504e688a27cdd75fdbbcf1bf1cc5708a9e2a7ea76aede75273d97abe87828c98520883bf39090d209d480d06cb465147aa9c372780a77f1eedb3318ebb702a7af48f0853d08df177a5753f8eefd18b4fe22ddd5b5ff517593ff3132698e8c74d9f2088ef7a355c66ad4402a0cea32bc6f1b32f1ef763dd8647068e55bdb107eb005891e7fb3020f9a65548be8a4323559472b2e23c144f256d90d01bdafb3c256fb01a5516c9dc1224d1a7ba56f42257a0b6c7ba29912d72ec945f3fc3268d640a0ffff29658ed7de596f69de5cf900e1fc6347caca97cea0166cf0c3daf1e79ed1dcd362c81c1a4ab54f0c5f521f02bf0f875079e1b86afca9c45982c37e169c214307d7e5aab082f4963daec2339fe36936251b196054f4c30124fc9ddd3133b41c91b15db91999dcc565fb6ae46073f915ba453b220ef42b70dc0cf6798879951bef79295b71088b2b9b58a5b3cf7d4881d61236c3dbc15776d7d1c99f6da12c3ccba66d34f5fc0c86fd91b48daf6ed07527e40fc8fca2b5903580b5072ee637a63d3794e5081cdcaba73d080938bd6a3739b17930cde0c5d6c666487d381b8ff3e6703b44fdf529422e3c6b35677cb85eec17ad7f1b1392fec0bf2bf342ad162e1e90ef19ec987bc7854838939b290d30bbc41f44b36100c055ada817b10c868b63ee9524275b836880049dfa6a51e3e5320fdc57d58c7c933479b24ac7f6789841be420eb4f409c43792521e9c2b62ed2fe23649fc856b3fe2c06923d494408a06775eb8eecd827b29b088618a7f5e41e537c9e76e8a10d2c39a674654539218336c0c9a0ebb3060a46e1c3eff11592e5b65859bc4a6e7481fad6b91e129d659a3c03130890f58abee7fd541779d2c41a4a394536b7054dd459512fabff90f47ef17abeaa0ac6aee008db1f68936e686086b9411462bfb16098f0daf528c6a322e85eb3f0dc8938ec4cfbf647e0c8670d34f4fb0f6e4ab0da49e36435f55591e54a90073b2e96527be39302d48b89efed02448fe8121b5c8227ddd4962cd321030a59128af807ed51f2eb3e49bf3609f40d6fd68ff46518fcaebb46cfd6b9b6de056ed2a22836c30e964395c331dfe627a390efe7ba16f4e3160d3f0d8670d9df141074aefa1dc8395e4ef2a6565d01c9db1947f3901ffd0314b81574d080bf43725cd597a27ed188073ea291cdb96b88fbd08cf3bf010f3faceaab5bcadd90e6b08a48035051e4e082e0e44ed003ad8dc9ddfca36f4739527d2bb40a57aef98f475547c249ddd209f2ad5869efed893bd11f6d5b4f4f3fac7dfc0158fc6f349e9662ed6b9636191a3a206f94ec7e1f3c52afb25c94be07298834a3b0042e3422ced615c8e7843801e22efafe433029952a7e6737666650789338e8be5c766d2930f8e89e63d4a6554e0c19fe2a237d93a120a9a9ac1bd22c622cb294c5282e9218a3bc44ca5afc45115ca1f064148b2aec0731be3f978fe71f48fad05635191318eed20f16a877bc79ad04743710ef978e9515c5174794de55eccbd903049405e205bfb8b915db72c7d1d390b3663b4d817f6eeaa2a1834d49f6bd8b7e94e67816f01c748a706a6d5bce15c2f0afe3db3f6060f7169d4a26241f1e33b08d8e0dcd6c059ad635a46e57c6224f6b102774aae9a516de3840d6917d6f1c4a67aea8aae0fde3292f55064066aa537bdec14ff20eac088921b798df8436065c70d278e5792ce42b206ec5657e8beeef7077919a1e38e707b7fd82567d7c8273305ba035cbe8ea384390d7c54e3a50c0aebe4a27dc566ba707e3d004ef11150b15b4c8beeb8d7f7cf1f2896e06270de1fd49d3446ff5f352c2aaa3d337f202d9f0e52f21bc7dfc84ef203f081c98b24bf22613308a1df6c2f432fbe95249c5857392661fa1f8b6f90e223c32b7a9da864116e3c43c6d7bfca2c2aacad4dea75558d2940df8427cad1c0642c8da81318517aee60bb75903b8ff182f9250233cc7c66b3ebd8c9b0c607a6f6c1046010781c470c0ac5d0c1145ae17fd8a6d793f8d84ba9e95acb96c64e4f901fd5de15ae79afb30e66ea8efbc043117120c4f412cf6cbba26c1cb477335d31da616e78980f4faf99471636c0cdccb03468da6406adc0a0cc128686cad6dbf1ee3aae112bbd09dd46c817c9056dc5298011f21612fe39a99c844534244152845aba9ea25247527f15e457d7d8d4387fefdf2f0567ccc35c7fb42b77743e06bf0eb0d088d6e39f798da3a6e3babaf86624497470f0f6c1e9cfc78f268a7b7623ccf41fece2dda3e1639bd4067efb74179295c7c82c899659e4198ae88ed514570ef95cb5a16d1703342ee1d5c15a837588c3f4622028ea020752a6c4049caf8f0f56fb7494857befd9782d1369c0debab38d764a8c6d339927b900aa3dbeb7cd185c73d3bb79516b591ad6230cd129dfe88e55d444826823c5924437ba466c11bd20d03df21476c394941015002f7b57c479335e37abdc800a1472e0404dfc09cb6666f1a78b6cdf9bc5e197b8d55d52fad3a1dbb00c6498ca7dd9ae1e78270c38cb61ceff8c5f8f5aafb19e8754089e8a71ab272fa62357a91be9fb6213d7017000fd97020e78848469e1459a3b886a5cfaf17d1f238dd2ad781527059f9e41edec367d1b4b538136e0971c28a571bcc546cbb57da7c4af9eba6c4c787a35cede13246711fa55c7757f0330a5fd542c8a491102886a8a1fd5f1d4da328e83214162c2cae1e167d71e44cfd5c78825f24353eeb48a9dd9e4d7e82bd4a9c6f0dbc07a6b9786a29c345a013a961eca6861be713b3edfcce0a4824c058071eee3834f8d21abde81030d6268136c8bb42933997aa00aa9ec95d979e48376b7f83d69952c907e7527380647525130950c49a8b4c114356b542a1cfa6817a6015c396f294818bc6ec35bd341b64925bf19f008bc8517c6de6980b52bc4eece7052a484fc014dba65cd65771\",\n        \"nonce\": \"55432e2d2e71260fa77a0303\",\n        \"preKey\": \"622d748ea36faf23469d1a0d7f25f1868eaa04a0de5805007c31afea63f7459c\",\n        \"salt\": \"273f72146fd9e548698499e9de92a5a8454ee691afa88acd58896796358f31e8\",\n        \"version\": \"eip191-aes256-gcm-hkdf-sha256\"\n    }",
  //     toDecrypt: true,
  //     env: ENV.STAGING
  //   ));
  //   print(chats)
  // }

}
