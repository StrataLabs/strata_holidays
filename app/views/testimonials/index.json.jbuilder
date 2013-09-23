json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :vacation_consultant_id, :content, :customer_id
  json.url testimonial_url(testimonial, format: :json)
end