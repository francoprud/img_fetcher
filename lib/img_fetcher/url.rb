require 'down'

module ImgFetcher
  class URL
    # On sucess: returns a Tempfile. On failure: returns nil.
    def self.download(line)
      Down.download(line, max_redirects: 0)

    # Decided to rescue all Down exceptions since they are all related to connection and URL.
    # By rescuing the exceptions, execution will continue and the rest of the URLs will be
    # downloaded.
    # We can notice that we could have one the following: Down::TooLarge, Down::InvalidUrl,
    # Down::TooManyRedirects, Down::ResponseError, Down::ClientError, Down::NotFound,
    # Down::ServerError, Down::ConnectionError, Down::TimeoutError, Down::SSLError.
    rescue Down::Error
      nil
    end
  end
end
