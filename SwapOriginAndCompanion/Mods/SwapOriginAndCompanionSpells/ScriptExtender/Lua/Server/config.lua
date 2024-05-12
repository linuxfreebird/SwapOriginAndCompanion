-- config.lua
-- Configuration for UUID mappings and other constants

config = {}

config.convert = {}

-- map player IDs to companion IDs
config.convert["S_Player_Gale_ad9af97d-75da-406a-ae13-7071c563f604"]="Companion9_4abec10d-c2d1-a505-a09a-719c83999847"
config.convert["S_Player_Laezel_58a69333-40bf-8358-1d17-fff240d7fb12"]="Companion1_6ae41c2e-e72a-c682-a014-18e638ced83f"
config.convert["S_Player_Wyll_c774d764-4a17-48dc-b470-32ace9ce447d"]="Companion2_26bdc9a8-aa89-9a52-042d-3defee5855eb"
config.convert["S_Player_Minsc_0de603c5-42e2-4811-9dad-f652de080eba"]="Companion3_afb9d9bb-9a52-4737-4d8d-c5c72f32b730"
config.convert["S_Player_ShadowHeart_3ed74f06-3c60-42dc-83f6-f034cb47c679"]="Companion4_1b5bd02e-2178-c73c-3eb0-b8f4fc4f7dc5"
config.convert["S_Player_Karlach_2c76687d-93a2-477b-8b18-8a14b549304c"]="Companion7_8e465ee5-ad2b-008b-966b-d1641e37e3c5"
config.convert["S_Player_Astarion_c7c13742-bacd-460a-8f65-f864fe41f255"]="Companion8_16ff923d-ab9b-bbc1-4480-2ec8d38f05ee"

-- append "S_Player_<Character>" to player ID string
config.convert["ad9af97d-75da-406a-ae13-7071c563f604"]="S_Player_Gale_ad9af97d-75da-406a-ae13-7071c563f604"
config.convert["58a69333-40bf-8358-1d17-fff240d7fb12"]="S_Player_Laezel_58a69333-40bf-8358-1d17-fff240d7fb12"
config.convert["c774d764-4a17-48dc-b470-32ace9ce447d"]="S_Player_Wyll_c774d764-4a17-48dc-b470-32ace9ce447d"
config.convert["0de603c5-42e2-4811-9dad-f652de080eba"]="S_Player_Minsc_0de603c5-42e2-4811-9dad-f652de080eba"
config.convert["3ed74f06-3c60-42dc-83f6-f034cb47c679"]="S_Player_ShadowHeart_3ed74f06-3c60-42dc-83f6-f034cb47c679"
config.convert["2c76687d-93a2-477b-8b18-8a14b549304c"]="S_Player_Karlach_2c76687d-93a2-477b-8b18-8a14b549304c"
config.convert["c7c13742-bacd-460a-8f65-f864fe41f255"]="S_Player_Astarion_c7c13742-bacd-460a-8f65-f864fe41f255"

config.convert[""]=""

config.avatar_tag = "306b9b05-1057-4770-aa17-01af21acd650"
config.avatar_faction = "Hero_Player1_6545a015-1b3d-66a4-6a0e-6ec62065cdb7"

return config
