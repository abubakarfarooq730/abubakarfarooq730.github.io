'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "ff5d9bc9e53ab8dd6df2233d60cccd24",
".git/config": "51f21d8de04315b15245bdde141f98f6",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "12c30ab80c3edbe5d0f3f6c6391aa6e1",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "a4ec932f9ee41a8e5817f92119e072cb",
".git/logs/refs/heads/main": "53c929d31a8f68dc4e3be5d9a40f1d7f",
".git/logs/refs/remotes/origin/main": "179667ee1d063b8206545346f1b02efc",
".git/objects/01/6683fc2fa0ea5506a1899bc1350f23112b3ff5": "4316e32656261c41459e63fbbd1e7cf9",
".git/objects/04/e4e83f5d270794d84fb214d87f51d320098cfc": "bb62925fbe53595dc01b68b39d192419",
".git/objects/05/a9058f513cce5faf1704e06e3c150688b0a01f": "e8d02f60cf87abd4c1de4b153dd696dc",
".git/objects/09/af521330be41ba2805d12b88331a429acfb036": "114a2a1b46cd71fc9be51fbe9850d679",
".git/objects/0a/000d7e5aa9179acea28935a52d01b3a26dfece": "15cb76f26e428441327c3656cd9da0c4",
".git/objects/0f/424ccc9b75e68d6ab0e7242615fa0cce95d741": "d8f78b4122e0d1f23662d6cd39f099da",
".git/objects/15/6aa08c87517f660e29c7bc9df31e7085e55f12": "02bf85c42c20dc6237533bbfab0cecc7",
".git/objects/17/b8b1dc4bb2e651ad933c60024724ce6d52552f": "c1810eb6ab1398e112ac7099ab73f2a9",
".git/objects/1a/d440a6aa3a86e5fe2c3e366fe2d3a5213d1b35": "ea8484a28b90654431a77bc605c3e274",
".git/objects/1b/07a8e858e64f23c1fd7b1612e58955d847774e": "4026d2878f0e6c855128860eb17ce119",
".git/objects/1d/9c4a107094e3b7c8768f9bc1bf19725e1a7d51": "e48885253cbc37ef7f5f3a443940663f",
".git/objects/1e/26fb7687820ea3e57bc158e3980922ced57240": "0a90a8240042afc49bd5b78eb9351d23",
".git/objects/1e/cc1cc716807d4e4fef0a86b9f5cc5204190304": "71becff211f7e3b23b5ac34ccaeca524",
".git/objects/1f/1cd68445bcc826bcfaefa36537c928bff56cde": "b94d0b2c409e3c2dd4961752c5d908a3",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/24/8362be0db90ee45dde367506eb3495b261d338": "1016ea5aadb2e5b3634919994209d438",
".git/objects/26/1c69e5a5b12f7969105a937f9c28ebb0ee8b53": "15709fdc8602270b5cdabc1752966a1d",
".git/objects/26/fa0483de785a11eb06f6428ccbedbe137d8db6": "2d5c7711f10ba8648256b9c20354abb4",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/2b/9ef40880d845fe265005a3b1f76fa16606f877": "1dcf24ae9b9349b9e1383910595d6a53",
".git/objects/2e/6360eef9128c60ccfc21e4dd52649860904b6d": "a742b8c8e5d4e3296d4d29c498af6168",
".git/objects/2f/83f9ed7cdbb154e64a8972762b58ce9d914085": "be8247bcaf28ac80d4289127304c16a7",
".git/objects/31/368fef88d5f92e5c5dbf25cb30ff11c428a16b": "468aafffc94cef45e08073d591976acc",
".git/objects/32/c2616b52baf00ada7abd1d38b5e7fcdf87ffe3": "89c096c29701d76465dde7b37961db99",
".git/objects/32/d9400045afe968471d293e2023574bff7fcd53": "e7a1fc1d208fa93671579c0b7d9caedf",
".git/objects/33/63b1898f228542d5fcba7dd44f3f29746d93f5": "57f6c23d30e723f9b0069f28175dfe44",
".git/objects/34/642a649f761129d3ea1734bc1f5df66b29282f": "d13684e6e8d5c4661002184b6fa70fdb",
".git/objects/34/e4051a1c4adff5fb39bb1fd51ae7604395333b": "be28aa9a65f078ddca0241773dde53af",
".git/objects/36/bd67afe4ee19ff131f275ab609e655106cd8e9": "aeb6c2e0700818522cf436563183a2ec",
".git/objects/38/f72c3b661274731c0dca4263c6147292c3313e": "06ec909689545717240ec77454003efe",
".git/objects/3b/4d6a7b3013c9bf3e9449f775652da3824d02b8": "d7d9ca2d6d7d073cc85b17e01d90a079",
".git/objects/3b/fee5ad7840be6af4e32eacc5724a8c7cb581f0": "617826bb69d65d258d5e0b319dfb79bf",
".git/objects/3c/49bb29a4930ce292fa92e5e01c0457f661dd7c": "d48543ae7fc44bacb1f17acbff7436cd",
".git/objects/3f/6e9ec073e3f469130b8855985ba0b4ea629748": "cce3b526c0210078b29cca96c85104a1",
".git/objects/40/5f51ad59ca3c8fc1bd53de844d48fc74f07da3": "6c838ceac7e81aa82162a6e9101f19a0",
".git/objects/41/0f9603830ec2f245761c29c20a5665f3cfc06a": "89afb5ca08e50055e6453b3363d38fce",
".git/objects/44/0afb0a89405e1f91a7c8544b7efa211880dcfe": "05ffd75e6d2f5da18dfb3cd28fb33601",
".git/objects/44/211b5bee11e9631f3dcbfcd724818914b7bda8": "aeac9ba326e4c9c0124cc9e85e59594f",
".git/objects/44/e133b2e772f4f5c34ad0f7cfa9e5187f62ede7": "c403af833e43a047ff0272fe2dd538f1",
".git/objects/45/115a8a84b6c353e19461855805bd0e4783549a": "b163fbfdf2deb0b1d0b9c05ecdb65e3c",
".git/objects/49/8120c68ef5d4bd1b5df9b458c02a895cfb61c7": "85b3e112470e25b32c238a17e492721a",
".git/objects/4b/9fe81c84b01557edcf1dc3627cd7df05a12cfe": "ac3f64f0026dc6a86d9950ab9ac1ed95",
".git/objects/4c/30c429a42ae1c75fb18221190b07af671d2892": "a9d3721307be32b9c5e91d178e3ebf26",
".git/objects/4f/ea776bf434eacef6cfdcfd8b1d931b4726fca2": "4fd7479f385c641bf82a99dcd53cf1fa",
".git/objects/50/fcd895423bec769cd2824c67447335f280411f": "36c4b1b9eb681918efbf23875c44a5b9",
".git/objects/52/1e100f4e62518b716445be65e473d534c9b291": "c4291ea6d2fac71ab2988b693d5a799b",
".git/objects/52/3fcfa5afae097408cf8a1564a6dfe67d94d0e0": "9e533f09f3f3023f900f823d7ff7e4b7",
".git/objects/54/8e9638f0cc4d2ae24d66a4c30db9f2fd9f7695": "d89d37a7471f6d64d036daa134b1e4b5",
".git/objects/56/068f896ab9a9ac8e470b1e626754b9e1d94d41": "1b9eee237100631c903d1e0b6e910762",
".git/objects/57/5145b75e7831cb837c78ff5cfe34fd1a96e6a4": "5b7c81adf0ca3167541309ba2561492b",
".git/objects/5e/5a6fe1f84ace7683d891271c45184a88a7d0f6": "0894ae640e5e4f82fa531646e5db4a96",
".git/objects/60/550b8adbf9a8994f7724a03d18944275f31ce6": "0fafc1af73981e0e079ac274747c1630",
".git/objects/61/f8f87f428b1a733cec046d00aff4531de57986": "a5c16fa65516a5483e4f7de12ed399b2",
".git/objects/62/dadc999a66c98fdf5c74ee01b8c4678ab15c48": "d9e9b665bddf071eb789c8f43582a5c6",
".git/objects/63/2368388c3d8dc0075cbf32a433cd57b718ef57": "406d9977c8f457e4f76b230c3148650c",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "8cc9c6021cbd64a862e0e47758619fb7",
".git/objects/66/916c129babbf93f0e1e405ca11bc2f4ed77854": "9e746a22e23cca2411ab1e0831887cae",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "2b2403c52cb620129b4bbc62f12abd57",
".git/objects/6d/6f1a4fd38c469c0a11da0a4c25943a6093c1ab": "cc24ae5c02e18801610fb5df6c6a29be",
".git/objects/6e/34ace03af133c8858c5cca3d4c1efe325dda13": "7546ccf196d22796b7a4a889f11d3c4d",
".git/objects/70/7806ec452a61766c0f5c7ad9a94550d39717e9": "03c01a674e1def5d9ab98ddba1b1a64b",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "1d813736c393435d016c1bfc46a6a3a6",
".git/objects/7a/9f930fac4a0cc75369984f43fcb5db56461d3f": "759db563d255f6cba07de08098210935",
".git/objects/7e/010fb71f21878c8dd30fb65714d954ae018c2b": "f537308fc203c72c91d69eeaebe15030",
".git/objects/7e/f91732edf950953bcc68402471997961f6426d": "12cddefbc8d136b0de40e18ca274cf36",
".git/objects/7f/3c1c5c210b7bdae0b163f2b11ac45eef03a6b3": "2d58a144f2fa9b5b47015a5e14002ed2",
".git/objects/7f/9962507a29c17e46d57fd64258ad62bb9a7d4e": "32cbe2fcf913f5e6edb6df65bd129843",
".git/objects/80/b957dee208ecdd5763283155933ff65cc9854e": "4baf6c8367739ffcce59c7eac26902ef",
".git/objects/81/e35011bfbd88e59b567ba5e8ebc12682a64ea2": "8c28da20bc4b5e6d235fb9f88c208303",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/86/5a9d6abc11621dcb8a53c98f559cc78eaf805b": "0d496dc6e5a7ed9416060dae460aba7b",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/59773bee8314a8ffb4431593d0fb49f52e34c6": "2eb993d30677573ffd0e58484cc6a514",
".git/objects/8c/75c9d80af8a22c68b7bd7b4c7e9f9bbe490c71": "bed6cf9f8527e585777e524058e30461",
".git/objects/8e/6a0a4871bdbc50a0761c8bfff1b86311428dbf": "9372ca7eb18817a00fa717904acd8284",
".git/objects/8e/962675d4ac8674a34b9f2935154b62325d48e0": "0ba607ad3ceeb74f6f11c7e8b649d848",
".git/objects/90/9dab1e4edfda7cd22f1fc3ff89358a5fc5e5ce": "a2dd43c4bd06a9d2e0d40dab948310d3",
".git/objects/95/65c6e2ef06081017ee0f37a94fc632793b0809": "ba244077ffce107c25f1e8cb98d05dc2",
".git/objects/96/cc266ad1a24fbcd426535d20c6d35f14d315fc": "c90dea807cf9cb2fd574a6ac21bd62de",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "dbaa9c6711faa6123b43ef2573bc1457",
".git/objects/9b/bb4b4826ea6ad5f32beeff301b61e03df57ff1": "93d244b1a7c70aeb7ef83e0666ebc857",
".git/objects/9c/5ce29e46bed607b42ec344e3e1bc47eddd21c2": "81c420018ab134cb21274fbb4bced947",
".git/objects/9d/4c68d943e1e2ee6d8e32c1c7644ec3c3eb5804": "7671259edac901af37893d79710e41fe",
".git/objects/9e/0b8e8a4419ff8e0a1bbb199ec12b5967779bc9": "552eafa32f46cee5648ae88e93482014",
".git/objects/9e/24d47b4317baa7468149a04c9c99a4b8de4b1b": "87e5cd8c2e58c56ef878e86113287217",
".git/objects/9e/b5f8330a16773fff37a5a5378610af9f884b0f": "ede8a601446f830ac021950c735a0ade",
".git/objects/9f/0e9a5e1e814ad8cdfe6d22338fc4f3c5fbfca3": "e9e211766d2f6b4c35cc8eff999804b7",
".git/objects/9f/505d9e9499fff0e3ab74b72954c13b027f9afd": "892f246d565e0d331d691fcd003b3c2f",
".git/objects/a1/ec85a106e9a6f6b1c78117861c54eb77869079": "ef29093b5649b2ae345309339bc8e3d6",
".git/objects/a4/debd551ec4753277cfa4cceb59da4a5e5ba33f": "b5eddb8d933e276b10a0e14d15672a00",
".git/objects/a5/fb376660614b3b00c5ade78d3f339f10d932a9": "e0680b1e4ba11723e165d5ceb588a0cd",
".git/objects/a8/b52ae393aeef956536749897a973682521c7e5": "7040cc1afd5af76034eb604c6d05d0ae",
".git/objects/a9/9f205164c961659cabf6b36fbdbb3fe966179f": "0b2e4f9993f0cdba63b783f9373297b0",
".git/objects/ab/8bbe76a94c2caa25299a3f764d6bbad7c1f2bd": "49127b22331a0ea9a530681236610878",
".git/objects/af/2e338ae30e40b0a69f0f2c3931272f3c513c17": "8860c95cba6db1b0cbbe56f405d29cd7",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "a9d4d1360c77d67b4bb052383a3bdfd9",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "e4c2e016668208ba57348269fcb46d7b",
".git/objects/b1/ddaca88c7d86c9885147d3f3234a82707a927f": "67466a403329b7360fdb2dde8832bc9f",
".git/objects/b3/3c00b568565a2e75958884467cf4e412309c08": "5dc0f873969114f3f365ee73010709ca",
".git/objects/b5/379d6e77fbfad10cad0ae3184363f6d1561036": "3080af10963ea38c151b75e2d931108c",
".git/objects/b6/939645debe0e8a055eab6a92e225f1305fc27d": "f6a3c6b26dbd233733a3f6738b8500f4",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/eb4d3382a75620ffd071c1dfe16d2f695ddb6b": "1d968e5b58659c3f08c457e61818ba1c",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/87030da90e905b85e2c0c7e25530826c34fb49": "0ee3b3d2c9768bfec649ae3e945ae9bc",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/ba/9aa30b7b6ad4dbc72cf7555927d38909ba803b": "e9ce89d52f7635e62a2bdf4084487dbd",
".git/objects/bc/c4d3c27588a0e1e73345f7b1ae009e1fc3e7b4": "c565b2a2c5a664803c3087b32e8943a3",
".git/objects/c2/6bf010fdaa4f80b774c38d1e88e0eda45ad77a": "23fc7cd7bacdbcf3ce93d6d889fd82ea",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "8c6432dca0ea3fdc0d215dcc05d00a66",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "ed187e1b169337b5fbbce611844136c6",
".git/objects/c7/2b0409a48fa266f739ec2d7e2f174193b2f232": "e9ed6c7d744104955fcde39513dcde5b",
".git/objects/c8/8918bb58b0eab4665e4fc3c3d7ded6423fc411": "f9ff6e6396bc150f6bc44da8fe3a8a11",
".git/objects/ca/854ed8664e42919a20787fb45bacf45cf80d19": "0ec43df489a3f8472c17a20a5a90901a",
".git/objects/cd/1b5559e14f16d4de7cdf328f8d099aa7de0f6d": "13b45e0b093afafb96305e37d8f22091",
".git/objects/d0/5b9f35221b41f5584caa354ce797ff285674d9": "cddcb6a8eafbee76789ccfcb9899a421",
".git/objects/d1/8f557e932461b6372a700a6e4e754e4be4f3db": "8c39630279b85bc383138e49d4b575e7",
".git/objects/d2/da59d917aedff51b44bf6c9ab37253ea07d7f8": "c9821cd57e6c3b640df338f909c65211",
".git/objects/d3/35228ebd62f486a5d236abd7933a5a582adad3": "a045e3fef46de28dd3542f23f1f5c9c4",
".git/objects/d3/c5ef8b4d1effe9e6a9600580519426aaffee12": "fa6a002e2052b7f216cc8e51f7c0afa1",
".git/objects/d3/d4f8f24e199af890f5e765d0e193d1ffdbf38c": "c12cf42fb3e99a37e8b9c5b35ef39642",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/59da4eb1ba421e08d7ceb62e647c65a5f03d4a": "33ec6848cf1b32b53318d40f0e64b1b7",
".git/objects/d7/90a42d3b4bd20abb6f7de4609f0eeebf31002d": "d3662764bfce583855f4a7b0733be22b",
".git/objects/dc/0c2a5154dad3b27ebf7e4f03d33cbce7376c04": "9781e99db048dc4f5d02bd9d2a4b6666",
".git/objects/dc/37339ae3c81b965540fda79c7ee35159cb68d7": "a74993170c1196780b065ffec2c6537d",
".git/objects/dc/9a59c149b30f949f83e68c0a5aa6852b85fef6": "66df6ea5370d310e7ab008b4ab71d222",
".git/objects/e0/bb22f55917edf280baf5e1bf0769704646a22c": "5ca5aa2262a9e47e7d2051a2f703e2b6",
".git/objects/ea/99f8990de53d7085fb9fc704ad2b2728a7c700": "c1065f1df5759d7094e0bf053a6a9351",
".git/objects/ea/d644a71fc403ecddc7e257fd95899bc83f7a53": "7cf6e9abc36e7b611599a12a220365d0",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/eb/9f5ae78d3571e54e76d193f483bcf16b77f47f": "bb0ca4747c1ee192930a6964734ba3fa",
".git/objects/eb/e1353c6b3047d436afeadec3866ab00eaa1b13": "f3f284b930b04a70eedbb7e224fbaab6",
".git/objects/ec/14306ac4690ad77e6a8ce1f27456794d29af02": "042f060c3f9d9aa0a3ce7b41d47970fa",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/f1/026c6de1ac16f06419d7492811a77902075139": "c41f9de93dcc0dee54696e73c802d569",
".git/objects/f1/2520f4f93d4e0565dca8e1efe7e989b6f1a839": "d3790668d136d57b1e9c36c37c25916d",
".git/objects/f1/4f3448c4605913ed2840da445e8d3fe4643764": "d3b812550617d7c0284b83480da46469",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f6/80a6cac22373d00452ebedb447c36ca416c037": "70f0a1a2752a3fb7d55fc61a506e0093",
".git/objects/f7/6bde6a2b90e46489244fe578207eca11677376": "3923b5ef58bfd28105cff1032ff7aab1",
".git/objects/f9/ea617ea88e05fc1a9bd651f063a50fb6b48eae": "dbacfdefff3235f8c2f2739b9622d45d",
".git/objects/fa/1de640b5d545f322ec2a3cfc5571b580862a9f": "4a2cef113942a47ed44104387e5db6a0",
".git/refs/heads/main": "ffd899e08790de013b1e01409e195185",
".git/refs/remotes/origin/main": "ffd899e08790de013b1e01409e195185",
"assets/AssetManifest.bin": "f4519f7c9b0aa940b381b9132d12ff21",
"assets/AssetManifest.bin.json": "339a32c7f32f44bd2758a59be1aa0645",
"assets/AssetManifest.json": "a07cf965691d61cd4cf980488b0a918b",
"assets/assets/images/Capture.PNG": "f4ecabf5ce28052ea30c3aaef0bf8fe4",
"assets/assets/images/download.png": "d56d3294793afc0ec183d2210f581496",
"assets/assets/images/img.png": "cd3e55609db347b3b9de0983dfa94d63",
"assets/assets/images/login.png": "c86f57dbfb277f69e6d8050c7fe7b4b5",
"assets/assets/images/logo.png": "9c59cd7b3657218d9592a7bc5a45cc8a",
"assets/assets/images/money.PNG": "db1297f1f38896161f6f25b696fa3811",
"assets/assets/images/mps.jpg": "e4cfa286e3428481f1c05ee4dfd3e402",
"assets/assets/images/profa.webp": "4a4ba0c648f2e4353d1ea04594487f56",
"assets/assets/images/r.png": "251abc545bacf3bacb7325a1dd9ac361",
"assets/assets/images/sale.jpg": "1d1f456537c250d852363236bb86984e",
"assets/assets/images/selliono.png": "66a33cf7c5c057d285bdd9524b2b3eb8",
"assets/assets/images/ss.png": "b57fe065b32eeeb42ac6a293426b26d2",
"assets/FontManifest.json": "74a3cf565c463b0908484103a9ce5bf4",
"assets/fonts/MaterialIcons-Regular.otf": "5987b3b92c0f3d1ab633124fbba5c066",
"assets/NOTICES": "d1e70852b8d3994908d044730b55844f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "739ec6b51a8d1ce791df35ba60e5f617",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "50297f65363c23b77a15faf4b360f31d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "697d95eadc858e3c9c7cb4deac41eb82",
"assets/packages/syncfusion_flutter_datagrid/assets/font/FilterIcon.ttf": "b8e5e5bf2b490d3576a9562f24395532",
"assets/packages/syncfusion_flutter_datagrid/assets/font/UnsortIcon.ttf": "acdd567faa403388649e37ceb9adeb44",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "884f06dedbb0bfa2db71b9770a569b28",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "257f015899b55ba365b79feee29a2b9d",
"/": "257f015899b55ba365b79feee29a2b9d",
"main.dart.js": "db61488479982fc39bd3a2161d04419a",
"manifest.json": "d57927ec34b719055160aeef942dd15e",
"version.json": "fd180e0e9d3cff43c129e3bad50157d6"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
