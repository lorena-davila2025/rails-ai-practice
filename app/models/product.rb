class Product < ApplicationRecord
  has_neighbors :embedding
  # after_create :set_embedding

  private

  def set_embedding
    return if embedding.present?

    client = OpenAI::Client.new

    begin
      response = client.embeddings(
        parameters: {
          model: 'text-embedding-3-small',
          input: "Product: #{name}. Description: #{description}"
        }
      )
      embedding = response['data'][0]['embedding']
      update(embedding: embedding)
    rescue Faraday::TooManyRequestsError => e
      Rails.logger.warn("Rate limited by OpenAI: #{e.message}. Retrying in 10 seconds...")
      sleep 10
      retry
    rescue => e
      Rails.logger.error("Embedding failed for #{name}: #{e.message}")
    end
  end

  # to test the embedding in rails console
  # client = OpenAI::Client.new

  # Product.where(embedding: nil).limit(1).each do |product|
  # input_text = "Product: #{product.name}. Description: #{product.description}"

  # begin
  # response = client.embeddings(
  # parameters: {
  # model: 'text-embedding-3-small',
  # input: input_text
  # }
  # )
  # embedding = response['data'][0]['embedding']
  # product.update(embedding: embedding)
  # puts "✅ Embedded: #{product.name}"
  # sleep 1.5 # Sleep to avoid rate limiting
  # rescue Faraday::TooManyRequestsError
  # puts "⚠️ Rate limit hit. Try again later."
  # break
  # rescue => e
  # puts "❌ Failed on #{product.name}: #{e.message}"
  # end
  # end

end
