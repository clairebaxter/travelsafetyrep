Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "377214739380009", "734b90ab5b5ea3c2f6c7bf9008d6dbb6"
end