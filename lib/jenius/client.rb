# encoding: utf-8

#
# WARNING: Do not edit by hand, this file was generated by Heroics:
#
#   https://github.com/interagent/heroics
#

require 'heroics'
require 'uri'

module Jenius
  # Get a Client configured to use HTTP Basic authentication.
  #
  # @param api_key [String] The API key to use when connecting.
  # @param options [Hash<Symbol,String>] Optionally, custom settings
  #   to use with the client.  Allowed options are `default_headers`,
  #   `cache`, `user` and `url`.
  # @return [Client] A client configured to use the API with HTTP Basic
  #   authentication.
  def self.connect(api_key, options=nil)
    options = custom_options(options)
    uri = URI.parse(options[:url])
    uri.user = URI.encode_www_form_component options.fetch(:user, 'user')
    uri.password = api_key
    client = Heroics.client_from_schema(SCHEMA, uri.to_s, options)
    Client.new(client)
  end

  # Get a Client configured to use OAuth authentication.
  #
  # @param oauth_token [String] The OAuth token to use with the API.
  # @param options [Hash<Symbol,String>] Optionally, custom settings
  #   to use with the client.  Allowed options are `default_headers`,
  #   `cache` and `url`.
  # @return [Client] A client configured to use the API with OAuth
  #   authentication.
  def self.connect_oauth(oauth_token, options=nil)
    options = custom_options(options)
    url = options[:url]
    client = Heroics.oauth_client_from_schema(oauth_token, SCHEMA, url, options)
    Client.new(client)
  end

  # Get a Client configured to use Token authentication.
  #
  # @param token [String] The token to use with the API.
  # @param options [Hash<Symbol,String>] Optionally, custom settings
  #   to use with the client.  Allowed options are `default_headers`,
  #   `cache` and `url`.
  # @return [Client] A client configured to use the API with OAuth
  #   authentication.
  def self.connect_token(token, options=nil)
    options = custom_options(options)
    url = options[:url]
    client = Heroics.token_client_from_schema(token, SCHEMA, url, options)
    Client.new(client)
  end

  # Get customized options.
  def self.custom_options(options)
    return default_options if options.nil?

    final_options = default_options
    if options[:default_headers]
      final_options[:default_headers].merge!(options[:default_headers])
    end
    final_options[:cache] = options[:cache] if options[:cache]
    final_options[:url] = options[:url] if options[:url]
    final_options[:user] = options[:user] if options[:user]
    final_options
  end

  # Get the default options.
  def self.default_options
    default_headers = {}
    cache = Moneta.new(:Memory)
    {
      default_headers: default_headers,
      cache:           cache,
      url:             "https://api.genius.com"
    }
  end

  private_class_method :default_options, :custom_options

  # Genius API
  class Client
    def initialize(client)
      @client = client
    end

    # FIXME
    #
    # @return [Account]
    def account
      @account_resource ||= Account.new(@client)
    end

    # FIXME
    #
    # @return [Annotation]
    def annotation
      @annotation_resource ||= Annotation.new(@client)
    end

    # FIXME
    #
    # @return [Artist]
    def artist
      @artist_resource ||= Artist.new(@client)
    end

    # FIXME
    #
    # @return [Referent]
    def referent
      @referent_resource ||= Referent.new(@client)
    end

    # FIXME
    #
    # @return [Search]
    def search
      @search_resource ||= Search.new(@client)
    end

    # FIXME
    #
    # @return [Song]
    def song
      @song_resource ||= Song.new(@client)
    end

    # FIXME
    #
    # @return [WebPage]
    def web_page
      @web_page_resource ||= WebPage.new(@client)
    end
  end

  private

  # FIXME
  class Account
    def initialize(client)
      @client = client
    end

    # Create a new account.
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.account.create(body)
    end

    # Delete an existing account.
    #
    # @param account_id_or_account_name: unique identifier of account or unique name of account
    def delete(account_id_or_account_name)
      @client.account.delete(account_id_or_account_name)
    end

    # Info for existing account.
    #
    # @param account_id_or_account_name: unique identifier of account or unique name of account
    def info(account_id_or_account_name)
      @client.account.info(account_id_or_account_name)
    end

    # List existing accounts.
    def list()
      @client.account.list()
    end

    # Update an existing account.
    #
    # @param account_id_or_account_name: unique identifier of account or unique name of account
    # @param body: the object to pass as the request payload
    def update(account_id_or_account_name, body)
      @client.account.update(account_id_or_account_name, body)
    end
  end

  # FIXME
  class Annotation
    def initialize(client)
      @client = client
    end

    # Create a new annotation.
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.annotation.create(body)
    end

    # Delete an existing annotation.
    #
    # @param annotation_id_or_annotation_name: unique identifier of annotation or unique name of annotation
    def delete(annotation_id_or_annotation_name)
      @client.annotation.delete(annotation_id_or_annotation_name)
    end

    # Info for existing annotation.
    #
    # @param annotation_id_or_annotation_name: unique identifier of annotation or unique name of annotation
    def info(annotation_id_or_annotation_name)
      @client.annotation.info(annotation_id_or_annotation_name)
    end

    # List existing annotations.
    def list()
      @client.annotation.list()
    end

    # Update an existing annotation.
    #
    # @param annotation_id_or_annotation_name: unique identifier of annotation or unique name of annotation
    # @param body: the object to pass as the request payload
    def update(annotation_id_or_annotation_name, body)
      @client.annotation.update(annotation_id_or_annotation_name, body)
    end
  end

  # FIXME
  class Artist
    def initialize(client)
      @client = client
    end

    # Create a new artist.
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.artist.create(body)
    end

    # Delete an existing artist.
    #
    # @param artist_id_or_artist_name: unique identifier of artist or unique name of artist
    def delete(artist_id_or_artist_name)
      @client.artist.delete(artist_id_or_artist_name)
    end

    # Info for existing artist.
    #
    # @param artist_id_or_artist_name: unique identifier of artist or unique name of artist
    def info(artist_id_or_artist_name)
      @client.artist.info(artist_id_or_artist_name)
    end

    # List existing artists.
    def list()
      @client.artist.list()
    end

    # Update an existing artist.
    #
    # @param artist_id_or_artist_name: unique identifier of artist or unique name of artist
    # @param body: the object to pass as the request payload
    def update(artist_id_or_artist_name, body)
      @client.artist.update(artist_id_or_artist_name, body)
    end
  end

  # FIXME
  class Referent
    def initialize(client)
      @client = client
    end

    # Create a new referent.
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.referent.create(body)
    end

    # Delete an existing referent.
    #
    # @param referent_id_or_referent_name: unique identifier of referent or unique name of referent
    def delete(referent_id_or_referent_name)
      @client.referent.delete(referent_id_or_referent_name)
    end

    # Info for existing referent.
    #
    # @param referent_id_or_referent_name: unique identifier of referent or unique name of referent
    def info(referent_id_or_referent_name)
      @client.referent.info(referent_id_or_referent_name)
    end

    # List existing referents.
    def list()
      @client.referent.list()
    end

    # Update an existing referent.
    #
    # @param referent_id_or_referent_name: unique identifier of referent or unique name of referent
    # @param body: the object to pass as the request payload
    def update(referent_id_or_referent_name, body)
      @client.referent.update(referent_id_or_referent_name, body)
    end
  end

  # FIXME
  class Search
    def initialize(client)
      @client = client
    end

    # Create a new search.
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.search.create(body)
    end

    # Delete an existing search.
    #
    # @param search_id_or_search_name: unique identifier of search or unique name of search
    def delete(search_id_or_search_name)
      @client.search.delete(search_id_or_search_name)
    end

    # Info for existing search.
    #
    # @param search_id_or_search_name: unique identifier of search or unique name of search
    def info(search_id_or_search_name)
      @client.search.info(search_id_or_search_name)
    end

    # List existing searchs.
    def list()
      @client.search.list()
    end

    # Update an existing search.
    #
    # @param search_id_or_search_name: unique identifier of search or unique name of search
    # @param body: the object to pass as the request payload
    def update(search_id_or_search_name, body)
      @client.search.update(search_id_or_search_name, body)
    end
  end

  # FIXME
  class Song
    def initialize(client)
      @client = client
    end

    # Create a new song.
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.song.create(body)
    end

    # Delete an existing song.
    #
    # @param song_id_or_song_name: unique identifier of song or unique name of song
    def delete(song_id_or_song_name)
      @client.song.delete(song_id_or_song_name)
    end

    # Info for existing song.
    #
    # @param song_id_or_song_name: unique identifier of song or unique name of song
    def info(song_id_or_song_name)
      @client.song.info(song_id_or_song_name)
    end

    # List existing songs.
    def list()
      @client.song.list()
    end

    # Update an existing song.
    #
    # @param song_id_or_song_name: unique identifier of song or unique name of song
    # @param body: the object to pass as the request payload
    def update(song_id_or_song_name, body)
      @client.song.update(song_id_or_song_name, body)
    end
  end

  # FIXME
  class WebPage
    def initialize(client)
      @client = client
    end

    # Create a new web_page.
    #
    # @param body: the object to pass as the request payload
    def create(body)
      @client.web_page.create(body)
    end

    # Delete an existing web_page.
    #
    # @param web_page_id_or_web_page_name: unique identifier of web_page or unique name of web_page
    def delete(web_page_id_or_web_page_name)
      @client.web_page.delete(web_page_id_or_web_page_name)
    end

    # Info for existing web_page.
    #
    # @param web_page_id_or_web_page_name: unique identifier of web_page or unique name of web_page
    def info(web_page_id_or_web_page_name)
      @client.web_page.info(web_page_id_or_web_page_name)
    end

    # List existing web_pages.
    def list()
      @client.web_page.list()
    end

    # Update an existing web_page.
    #
    # @param web_page_id_or_web_page_name: unique identifier of web_page or unique name of web_page
    # @param body: the object to pass as the request payload
    def update(web_page_id_or_web_page_name, body)
      @client.web_page.update(web_page_id_or_web_page_name, body)
    end
  end

  SCHEMA = Heroics::Schema.new(MultiJson.load(<<-'HEROICS_SCHEMA'))
{
  "$schema": "http://interagent.github.io/interagent-hyper-schema",
  "type": [
    "object"
  ],
  "definitions": {
    "account": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "FIXME - Account",
      "description": "FIXME",
      "stability": "prototype",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of account",
          "readOnly": true,
          "format": "uuid",
          "type": [
            "string"
          ]
        },
        "name": {
          "description": "unique name of account",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "identity": {
          "anyOf": [
            {
              "$ref": "#/definitions/account/definitions/id"
            },
            {
              "$ref": "#/definitions/account/definitions/name"
            }
          ]
        },
        "created_at": {
          "description": "when account was created",
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "updated_at": {
          "description": "when account was updated",
          "format": "date-time",
          "type": [
            "string"
          ]
        }
      },
      "links": [
        {
          "description": "Create a new account.",
          "href": "/accounts",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "Delete an existing account.",
          "href": "/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}",
          "method": "DELETE",
          "rel": "destroy",
          "title": "Delete"
        },
        {
          "description": "Info for existing account.",
          "href": "/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        },
        {
          "description": "List existing accounts.",
          "href": "/accounts",
          "method": "GET",
          "rel": "instances",
          "title": "List"
        },
        {
          "description": "Update an existing account.",
          "href": "/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}",
          "method": "PATCH",
          "rel": "update",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Update"
        }
      ],
      "properties": {
        "created_at": {
          "$ref": "#/definitions/account/definitions/created_at"
        },
        "id": {
          "$ref": "#/definitions/account/definitions/id"
        },
        "name": {
          "$ref": "#/definitions/account/definitions/name"
        },
        "updated_at": {
          "$ref": "#/definitions/account/definitions/updated_at"
        }
      }
    },
    "annotation": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "FIXME - Annotation",
      "description": "FIXME",
      "stability": "prototype",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of annotation",
          "readOnly": true,
          "format": "uuid",
          "type": [
            "string"
          ]
        },
        "name": {
          "description": "unique name of annotation",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "identity": {
          "anyOf": [
            {
              "$ref": "#/definitions/annotation/definitions/id"
            },
            {
              "$ref": "#/definitions/annotation/definitions/name"
            }
          ]
        },
        "created_at": {
          "description": "when annotation was created",
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "updated_at": {
          "description": "when annotation was updated",
          "format": "date-time",
          "type": [
            "string"
          ]
        }
      },
      "links": [
        {
          "description": "Create a new annotation.",
          "href": "/annotations",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "Delete an existing annotation.",
          "href": "/annotations/{(%23%2Fdefinitions%2Fannotation%2Fdefinitions%2Fidentity)}",
          "method": "DELETE",
          "rel": "destroy",
          "title": "Delete"
        },
        {
          "description": "Info for existing annotation.",
          "href": "/annotations/{(%23%2Fdefinitions%2Fannotation%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        },
        {
          "description": "List existing annotations.",
          "href": "/annotations",
          "method": "GET",
          "rel": "instances",
          "title": "List"
        },
        {
          "description": "Update an existing annotation.",
          "href": "/annotations/{(%23%2Fdefinitions%2Fannotation%2Fdefinitions%2Fidentity)}",
          "method": "PATCH",
          "rel": "update",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Update"
        }
      ],
      "properties": {
        "created_at": {
          "$ref": "#/definitions/annotation/definitions/created_at"
        },
        "id": {
          "$ref": "#/definitions/annotation/definitions/id"
        },
        "name": {
          "$ref": "#/definitions/annotation/definitions/name"
        },
        "updated_at": {
          "$ref": "#/definitions/annotation/definitions/updated_at"
        }
      }
    },
    "artist": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "FIXME - Artist",
      "description": "FIXME",
      "stability": "prototype",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of artist",
          "readOnly": true,
          "format": "uuid",
          "type": [
            "string"
          ]
        },
        "name": {
          "description": "unique name of artist",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "identity": {
          "anyOf": [
            {
              "$ref": "#/definitions/artist/definitions/id"
            },
            {
              "$ref": "#/definitions/artist/definitions/name"
            }
          ]
        },
        "created_at": {
          "description": "when artist was created",
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "updated_at": {
          "description": "when artist was updated",
          "format": "date-time",
          "type": [
            "string"
          ]
        }
      },
      "links": [
        {
          "description": "Create a new artist.",
          "href": "/artists",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "Delete an existing artist.",
          "href": "/artists/{(%23%2Fdefinitions%2Fartist%2Fdefinitions%2Fidentity)}",
          "method": "DELETE",
          "rel": "destroy",
          "title": "Delete"
        },
        {
          "description": "Info for existing artist.",
          "href": "/artists/{(%23%2Fdefinitions%2Fartist%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        },
        {
          "description": "List existing artists.",
          "href": "/artists",
          "method": "GET",
          "rel": "instances",
          "title": "List"
        },
        {
          "description": "Update an existing artist.",
          "href": "/artists/{(%23%2Fdefinitions%2Fartist%2Fdefinitions%2Fidentity)}",
          "method": "PATCH",
          "rel": "update",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Update"
        }
      ],
      "properties": {
        "created_at": {
          "$ref": "#/definitions/artist/definitions/created_at"
        },
        "id": {
          "$ref": "#/definitions/artist/definitions/id"
        },
        "name": {
          "$ref": "#/definitions/artist/definitions/name"
        },
        "updated_at": {
          "$ref": "#/definitions/artist/definitions/updated_at"
        }
      }
    },
    "referent": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "FIXME - Referent",
      "description": "FIXME",
      "stability": "prototype",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of referent",
          "readOnly": true,
          "format": "uuid",
          "type": [
            "string"
          ]
        },
        "name": {
          "description": "unique name of referent",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "identity": {
          "anyOf": [
            {
              "$ref": "#/definitions/referent/definitions/id"
            },
            {
              "$ref": "#/definitions/referent/definitions/name"
            }
          ]
        },
        "created_at": {
          "description": "when referent was created",
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "updated_at": {
          "description": "when referent was updated",
          "format": "date-time",
          "type": [
            "string"
          ]
        }
      },
      "links": [
        {
          "description": "Create a new referent.",
          "href": "/referents",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "Delete an existing referent.",
          "href": "/referents/{(%23%2Fdefinitions%2Freferent%2Fdefinitions%2Fidentity)}",
          "method": "DELETE",
          "rel": "destroy",
          "title": "Delete"
        },
        {
          "description": "Info for existing referent.",
          "href": "/referents/{(%23%2Fdefinitions%2Freferent%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        },
        {
          "description": "List existing referents.",
          "href": "/referents",
          "method": "GET",
          "rel": "instances",
          "title": "List"
        },
        {
          "description": "Update an existing referent.",
          "href": "/referents/{(%23%2Fdefinitions%2Freferent%2Fdefinitions%2Fidentity)}",
          "method": "PATCH",
          "rel": "update",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Update"
        }
      ],
      "properties": {
        "created_at": {
          "$ref": "#/definitions/referent/definitions/created_at"
        },
        "id": {
          "$ref": "#/definitions/referent/definitions/id"
        },
        "name": {
          "$ref": "#/definitions/referent/definitions/name"
        },
        "updated_at": {
          "$ref": "#/definitions/referent/definitions/updated_at"
        }
      }
    },
    "search": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "FIXME - Search",
      "description": "FIXME",
      "stability": "prototype",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of search",
          "readOnly": true,
          "format": "uuid",
          "type": [
            "string"
          ]
        },
        "name": {
          "description": "unique name of search",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "identity": {
          "anyOf": [
            {
              "$ref": "#/definitions/search/definitions/id"
            },
            {
              "$ref": "#/definitions/search/definitions/name"
            }
          ]
        },
        "created_at": {
          "description": "when search was created",
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "updated_at": {
          "description": "when search was updated",
          "format": "date-time",
          "type": [
            "string"
          ]
        }
      },
      "links": [
        {
          "description": "Create a new search.",
          "href": "/searchs",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "Delete an existing search.",
          "href": "/searchs/{(%23%2Fdefinitions%2Fsearch%2Fdefinitions%2Fidentity)}",
          "method": "DELETE",
          "rel": "destroy",
          "title": "Delete"
        },
        {
          "description": "Info for existing search.",
          "href": "/searchs/{(%23%2Fdefinitions%2Fsearch%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        },
        {
          "description": "List existing searchs.",
          "href": "/searchs",
          "method": "GET",
          "rel": "instances",
          "title": "List"
        },
        {
          "description": "Update an existing search.",
          "href": "/searchs/{(%23%2Fdefinitions%2Fsearch%2Fdefinitions%2Fidentity)}",
          "method": "PATCH",
          "rel": "update",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Update"
        }
      ],
      "properties": {
        "created_at": {
          "$ref": "#/definitions/search/definitions/created_at"
        },
        "id": {
          "$ref": "#/definitions/search/definitions/id"
        },
        "name": {
          "$ref": "#/definitions/search/definitions/name"
        },
        "updated_at": {
          "$ref": "#/definitions/search/definitions/updated_at"
        }
      }
    },
    "song": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "FIXME - Song",
      "description": "FIXME",
      "stability": "prototype",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of song",
          "readOnly": true,
          "format": "uuid",
          "type": [
            "string"
          ]
        },
        "name": {
          "description": "unique name of song",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "identity": {
          "anyOf": [
            {
              "$ref": "#/definitions/song/definitions/id"
            },
            {
              "$ref": "#/definitions/song/definitions/name"
            }
          ]
        },
        "created_at": {
          "description": "when song was created",
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "updated_at": {
          "description": "when song was updated",
          "format": "date-time",
          "type": [
            "string"
          ]
        }
      },
      "links": [
        {
          "description": "Create a new song.",
          "href": "/songs",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "Delete an existing song.",
          "href": "/songs/{(%23%2Fdefinitions%2Fsong%2Fdefinitions%2Fidentity)}",
          "method": "DELETE",
          "rel": "destroy",
          "title": "Delete"
        },
        {
          "description": "Info for existing song.",
          "href": "/songs/{(%23%2Fdefinitions%2Fsong%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        },
        {
          "description": "List existing songs.",
          "href": "/songs",
          "method": "GET",
          "rel": "instances",
          "title": "List"
        },
        {
          "description": "Update an existing song.",
          "href": "/songs/{(%23%2Fdefinitions%2Fsong%2Fdefinitions%2Fidentity)}",
          "method": "PATCH",
          "rel": "update",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Update"
        }
      ],
      "properties": {
        "created_at": {
          "$ref": "#/definitions/song/definitions/created_at"
        },
        "id": {
          "$ref": "#/definitions/song/definitions/id"
        },
        "name": {
          "$ref": "#/definitions/song/definitions/name"
        },
        "updated_at": {
          "$ref": "#/definitions/song/definitions/updated_at"
        }
      }
    },
    "web_page": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "FIXME - Web_page",
      "description": "FIXME",
      "stability": "prototype",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of web_page",
          "readOnly": true,
          "format": "uuid",
          "type": [
            "string"
          ]
        },
        "name": {
          "description": "unique name of web_page",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "identity": {
          "anyOf": [
            {
              "$ref": "#/definitions/web_page/definitions/id"
            },
            {
              "$ref": "#/definitions/web_page/definitions/name"
            }
          ]
        },
        "created_at": {
          "description": "when web_page was created",
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "updated_at": {
          "description": "when web_page was updated",
          "format": "date-time",
          "type": [
            "string"
          ]
        }
      },
      "links": [
        {
          "description": "Create a new web_page.",
          "href": "/web_pages",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "Delete an existing web_page.",
          "href": "/web_pages/{(%23%2Fdefinitions%2Fweb_page%2Fdefinitions%2Fidentity)}",
          "method": "DELETE",
          "rel": "destroy",
          "title": "Delete"
        },
        {
          "description": "Info for existing web_page.",
          "href": "/web_pages/{(%23%2Fdefinitions%2Fweb_page%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        },
        {
          "description": "List existing web_pages.",
          "href": "/web_pages",
          "method": "GET",
          "rel": "instances",
          "title": "List"
        },
        {
          "description": "Update an existing web_page.",
          "href": "/web_pages/{(%23%2Fdefinitions%2Fweb_page%2Fdefinitions%2Fidentity)}",
          "method": "PATCH",
          "rel": "update",
          "schema": {
            "properties": {
            },
            "type": [
              "object"
            ]
          },
          "title": "Update"
        }
      ],
      "properties": {
        "created_at": {
          "$ref": "#/definitions/web_page/definitions/created_at"
        },
        "id": {
          "$ref": "#/definitions/web_page/definitions/id"
        },
        "name": {
          "$ref": "#/definitions/web_page/definitions/name"
        },
        "updated_at": {
          "$ref": "#/definitions/web_page/definitions/updated_at"
        }
      }
    }
  },
  "properties": {
    "account": {
      "$ref": "#/definitions/account"
    },
    "annotation": {
      "$ref": "#/definitions/annotation"
    },
    "artist": {
      "$ref": "#/definitions/artist"
    },
    "referent": {
      "$ref": "#/definitions/referent"
    },
    "search": {
      "$ref": "#/definitions/search"
    },
    "song": {
      "$ref": "#/definitions/song"
    },
    "web_page": {
      "$ref": "#/definitions/web_page"
    }
  },
  "description": "Genius API",
  "links": [
    {
      "href": "https://api.genius.com",
      "rel": "self"
    }
  ],
  "title": "Genius API"
}
HEROICS_SCHEMA
end
