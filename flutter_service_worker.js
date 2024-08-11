'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "318d253263dcbaf7de9df7b18fa7c1d0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/icons/message%25201.png": "93932fd62215f9d6e7421cc6ac7e33b9",
"assets/assets/icons/event%25201.png": "69aeb73c381ae4f5afd98ebd002c83fc",
"assets/assets/icons/google-mail%25201.png": "db3be649cf3ddcdc2cbb909669e74b23",
"assets/assets/icons/gmail.png": "914f309b3ed591d96f89876d70ff268f",
"assets/assets/icons/business.png": "ce7a45121b18f13c7e4d18c61feb1aac",
"assets/assets/icons/schedule.png": "8461ccb9a7c19150183fe3cc59958960",
"assets/assets/icons/calendar%25201.png": "7bac11179b4288b510e727fe3b721cb1",
"assets/assets/icons/science.png": "c1875bcc86ff795164a6d1684638cf4a",
"assets/assets/icons/image%25203.png": "48ce64ee3a4264bacd33f06eab40ea6e",
"assets/assets/icons/github_yellow.png": "df8076e79b899aeeb86f89a2072c2f91",
"assets/assets/icons/notification%25201.png": "b5fcad9eff330e2916a85422fb33f362",
"assets/assets/icons/Polygon%25201.png": "a8dc62843e4d5b03e779547f71253500",
"assets/assets/icons/up_vote_Icon.png": "366f3ee8ab21ace1982c3de081ccf460",
"assets/assets/icons/upvote.png": "199a439fe07eca02f1f397c400088b95",
"assets/assets/icons/image%25204.png": "95d6ef67b0a80199b72b913431c42d9f",
"assets/assets/icons/share_Icon.png": "ea1faebb0deac8341177437abbd57710",
"assets/assets/icons/downvote.png": "660607490a15014c1a3e6e266c2cb1a4",
"assets/assets/icons/researchgate.png": "482d0814bdb3fbaf6f66ccf5ee072dd3",
"assets/assets/icons/law.png": "a0479d8bc890adf1c4f6900f906ae149",
"assets/assets/icons/twitter.png": "6cbc75f6f9610c26d170ecea2fc8e277",
"assets/assets/icons/smiley_imogi.png": "45ee7fa9535542f8797dee50c339d2e4",
"assets/assets/icons/message.png": "93932fd62215f9d6e7421cc6ac7e33b9",
"assets/assets/icons/discussion.png": "7178b9b80a9dcfb994643b8750e8e819",
"assets/assets/icons/team.png": "1f8838118415d32a1e89c57a5af68821",
"assets/assets/icons/data_icon.png": "ff363b1f02db5ea57b7a6a5a98603ffa",
"assets/assets/icons/googlescholar_bg.png": "79cec3ffc195df1f24283593167c695b",
"assets/assets/icons/padlock.png": "dca8ac351d499765fdb8f184aaa77801",
"assets/assets/icons/website.png": "4ae7a2a7d59433ef6182f89be9a03134",
"assets/assets/icons/discussion_Icon.png": "87c261c88100fcd621dc7b8eedf7e213",
"assets/assets/icons/lock_yellow.png": "b92b3831bf2307c51e588cb977328864",
"assets/assets/icons/googlescholar.png": "a26970e4cfe5220ad1bddb020713a2ad",
"assets/assets/icons/share_icon_black.png": "44d1e55944a10d7438d07ad724796d3f",
"assets/assets/icons/github.png": "f8b44f12cb8cb8ec29783d46d730bc7e",
"assets/assets/icons/about.png": "b6a2f3ec0c10877a8992b613dd059f83",
"assets/assets/icons/bell.png": "10b014bccd31db36b99898de9a8f843c",
"assets/assets/icons/emojii_Icon.png": "a21b469074b42d168b6d12051e77e32a",
"assets/assets/icons/degree.png": "3f9b0b48c9d9067842df5a23633c6bec",
"assets/assets/icons/down_vote_Icon.png": "163384ee1aad02cf904a5d1385bcd47d",
"assets/assets/icons/gallery_Icon.png": "8af831559bb7a483e05e2e0ec5d24ffe",
"assets/assets/icons/mail.png": "4cce5c5c43aae1395e42d533703184b4",
"assets/assets/icons/image%25207.png": "cb7a3de4915d8257d90cd701bdb724cf",
"assets/assets/icons/scholar.png": "01b357ddace83f3e78fb5764791dfb8a",
"assets/assets/icons/calendar_icon.png": "3a21b6e5f6e7fc19c2b3a7b6e6e76bc3",
"assets/assets/icons/gallery-add.png": "3c2ce9ae171e67f6597246a13654d2e5",
"assets/assets/icons/department.png": "f46fdf29d4c025289f7a70050729a019",
"assets/assets/icons/chat_icon.png": "fedd08e68c8ccce491deb04334b93334",
"assets/assets/images/lw_logo_light.png": "f9936f37409bb1c5cf705c7f1e14a25a",
"assets/assets/images/srm_logo_wname_light.png": "143e197a4a9b9300fc91561cb1e0109a",
"assets/assets/images/bluebells.jpg": "d05b91ca17587b49c319d0abca09aeea",
"assets/assets/images/srm_logo_wname_dark.png": "1f5cc600271a2dd15e0d992f35070e73",
"assets/assets/images/lw_logo_dark.png": "e1d33854cf59a18c40be7711f2e9cebd",
"assets/assets/images/Techutsav%2520Certificate%2520%25203.png": "86274db2bc1379dfa7d64836bacbceb4",
"assets/assets/images/bg_white.jpg": "7f1826acb33dd1376a67ffe6e0abaeea",
"assets/assets/images/landing_img.png": "827ac94b74c3577109d4db4a611c21af",
"assets/assets/images/man-uploading-data.png": "192baabb2b0cf9792676de07d52f79d2",
"assets/assets/images/Rectangle%252014.png": "a81b709f093376b7fefb414b564e2b7d",
"assets/assets/images/post.png": "aeb6f80f2331c62bd94536e32aa64919",
"assets/assets/images/pfp.jpg": "5a5c509e2c2b0b315bbe0d7b10deed79",
"assets/assets/images/srm_logo.png": "1421c3ee8216be5a4a339ec24c710db5",
"assets/assets/images/logo.png": "857db60c14c75de6f349d6d470755144",
"assets/assets/images/google-icon.png": "57a3d257c3b6c4d783e4eeaab98e5b5d",
"assets/fonts/MaterialIcons-Regular.otf": "3f13b369ea6e2a6f1e1bd436a0f42d49",
"assets/AssetManifest.bin": "c41f0135e2f036bf1f617f24a10adeb3",
"assets/AssetManifest.json": "7aabface35b63bb8aff8a1e60db11dea",
"assets/NOTICES": "950f274bdfc938c32b5e9b09d545cf26",
"index.html": "64f25142dc5613d9091dc5a335ea8679",
"/": "64f25142dc5613d9091dc5a335ea8679",
"main.dart.js": "b69fb702d8d23461e99e19080383137c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "a20876bed8512571a7799e076d8bf7f6",
"flutter_bootstrap.js": "83589adce388c62b1ee326230fec42f9",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"manifest.json": "e42837193aed540806d05579314b559b",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061"};
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
