Spotify Web API token

OAuth Scope	user-read-playback-state

token: 
BQCM9mNG9pNg_7k-_b0YVA7Y_lmo97v78h42ao6ooaRU4dd0QApMjmjb45_4o77tslvb94stl7rhL-XeUO3L8PB-qpS15BKBVagN7bxEmj9yk3alBbIOQ_uLFgpoZr7srVBdZpHHD1avQhzmhkhvXawPliqFOFpzrmC7kXxJgL8KOAuth Scope	user-read-playback-state

example:
curl -X GET "https://api.spotify.com/v1/me/player" -H "Accept: application/json" -H "Authorization: Bearer BQCM9mNG9pNg_7k-_b0YVA7Y_lmo97v78h42ao6ooaRU4dd0QApMjmjb45_4o77tslvb94stl7rhL-XeUO3L8PB-qpS15BKBVagN7bxEmj9yk3alBbIOQ_uLFgpoZr7srVBdZpHHD1avQhzmhkhvXawPliqFOFpzrmC7kXxJgL8KOAuth Scope	user-read-playback-state"


returns:

Returns: 
{
  "timestamp" : 1497819542619,
  "progress_ms" : 184958,
  "is_playing" : true,
  "item" : {
    "album" : {
      "album_type" : "single",
      "artists" : [ {
        "external_urls" : {
          "spotify" : "https://open.spotify.com/artist/3E0I71KAPljQMKK2jkKhQM"
        },
        "href" : "https://api.spotify.com/v1/artists/3E0I71KAPljQMKK2jkKhQM",
        "id" : "3E0I71KAPljQMKK2jkKhQM",
        "name" : "DUAL CHANNELS",
        "type" : "artist",
        "uri" : "spotify:artist:3E0I71KAPljQMKK2jkKhQM"
      }, {
        "external_urls" : {
          "spotify" : "https://open.spotify.com/artist/5rU8srE4iima2QCCUJBG2m"
        },
        "href" : "https://api.spotify.com/v1/artists/5rU8srE4iima2QCCUJBG2m",
        "id" : "5rU8srE4iima2QCCUJBG2m",
        "name" : "Two Notty",
        "type" : "artist",
        "uri" : "spotify:artist:5rU8srE4iima2QCCUJBG2m"
      }, {
        "external_urls" : {
          "spotify" : "https://open.spotify.com/artist/33gRM2Xb3B38RCx0tNlO5k"
        },
        "href" : "https://api.spotify.com/v1/artists/33gRM2Xb3B38RCx0tNlO5k",
        "id" : "33gRM2Xb3B38RCx0tNlO5k",
        "name" : "Freack",
        "type" : "artist",
        "uri" : "spotify:artist:33gRM2Xb3B38RCx0tNlO5k"
      } ],
      "available_markets" : [ "AD", "AR", "AT", "AU", "BE", "BG", "BO", "BR", "CA", "CH", "CL", "CO", "CR", "CY", "CZ", "DE", "DK", "DO", "EC", "EE", "ES", "FI", "FR", "GB", "GR", "GT", "HK", "HN", "HU", "ID", "IE", "IS", "JP", "LI", "LT", "LU", "LV", "MC", "MT", "MX", "MY", "NI", "NL", "NO", "NZ", "PA", "PE", "PH", "PL", "PT", "PY", "SE", "SG", "SK", "SV", "TR", "TW", "US", "UY" ],
      "external_urls" : {
        "spotify" : "https://open.spotify.com/album/0ff08V6yTkqmkfzM74RfDI"
      },
      "href" : "https://api.spotify.com/v1/albums/0ff08V6yTkqmkfzM74RfDI",
      "id" : "0ff08V6yTkqmkfzM74RfDI",
      "images" : [ {
        "height" : 600,
        "url" : "https://i.scdn.co/image/fbd16c46818476e6d91b0659c47d32534dc86bfc",
        "width" : 600
      }, {
        "height" : 300,
        "url" : "https://i.scdn.co/image/a5abec89cab2517a3c6250bfb95d9f93d57c184d",
        "width" : 300
      }, {
        "height" : 64,
        "url" : "https://i.scdn.co/image/9d131857b7d53bc86122b108458ead916dd05776",
        "width" : 64
      } ],
      "name" : "Be",
      "type" : "album",
      "uri" : "spotify:album:0ff08V6yTkqmkfzM74RfDI"
    },
    "artists" : [ {
      "external_urls" : {
        "spotify" : "https://open.spotify.com/artist/3E0I71KAPljQMKK2jkKhQM"
      },
      "href" : "https://api.spotify.com/v1/artists/3E0I71KAPljQMKK2jkKhQM",
      "id" : "3E0I71KAPljQMKK2jkKhQM",
      "name" : "DUAL CHANNELS",
      "type" : "artist",
      "uri" : "spotify:artist:3E0I71KAPljQMKK2jkKhQM"
    }, {
      "external_urls" : {
        "spotify" : "https://open.spotify.com/artist/5rU8srE4iima2QCCUJBG2m"
      },
      "href" : "https://api.spotify.com/v1/artists/5rU8srE4iima2QCCUJBG2m",
      "id" : "5rU8srE4iima2QCCUJBG2m",
      "name" : "Two Notty",
      "type" : "artist",
      "uri" : "spotify:artist:5rU8srE4iima2QCCUJBG2m"
    }, {
      "external_urls" : {
        "spotify" : "https://open.spotify.com/artist/33gRM2Xb3B38RCx0tNlO5k"
      },
      "href" : "https://api.spotify.com/v1/artists/33gRM2Xb3B38RCx0tNlO5k",
      "id" : "33gRM2Xb3B38RCx0tNlO5k",
      "name" : "Freack",
      "type" : "artist",
      "uri" : "spotify:artist:33gRM2Xb3B38RCx0tNlO5k"
    } ],
    "available_markets" : [ "AD", "AR", "AT", "AU", "BE", "BG", "BO", "BR", "CA", "CH", "CL", "CO", "CR", "CY", "CZ", "DE", "DK", "DO", "EC", "EE", "ES", "FI", "FR", "GB", "GR", "GT", "HK", "HN", "HU", "ID", "IE", "IS", "JP", "LI", "LT", "LU", "LV", "MC", "MT", "MX", "MY", "NI", "NL", "NO", "NZ", "PA", "PE", "PH", "PL", "PT", "PY", "SE", "SG", "SK", "SV", "TR", "TW", "US", "UY" ],
    "disc_number" : 1,
    "duration_ms" : 261463,
    "explicit" : false,
    "external_ids" : {
      "isrc" : "CH3131600286"
    },
    "external_urls" : {
      "spotify" : "https://open.spotify.com/track/2kTOmPQ34jj0EmtwxX5rfe"
    },
    "href" : "https://api.spotify.com/v1/tracks/2kTOmPQ34jj0EmtwxX5rfe",
    "id" : "2kTOmPQ34jj0EmtwxX5rfe",
    "name" : "Be",
    "popularity" : 30,
    "preview_url" : "https://p.scdn.co/mp3-preview/57c975608ac419f561ddcd80938c8350669309fe?cid=8897482848704f2a8f8d7c79726a70d4",
    "track_number" : 1,
    "type" : "track",
    "uri" : "spotify:track:2kTOmPQ34jj0EmtwxX5rfe"
  },
  "context" : {
    "external_urls" : {
      "spotify" : "http://open.spotify.com/user/spotify/playlist/37i9dQZEVXcQtZgaYeOOsF"
    },
    "href" : "https://api.spotify.com/v1/users/spotify/playlists/37i9dQZEVXcQtZgaYeOOsF",
    "type" : "playlist",
    "uri" : "spotify:user:spotify:playlist:37i9dQZEVXcQtZgaYeOOsF"
  },
  "device" : {
    "id" : "d5a46e89f2d5cbd5f7e9101a8b6b1ef35e19cf8e",
    "is_active" : true,
    "is_restricted" : false,
    "name" : "icarus-wing",
    "type" : "Computer",
    "volume_percent" : 90
  },
  "repeat_state" : "off",
  "shuffle_state" : true


