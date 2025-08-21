# AltTagGen

**AltTagGen** is a Ruby gem that generates descriptive alt text for images using OpenAI’s GPT models. Simply provide an image URL, and the gem returns a short, human-readable alt text suitable for accessibility.

---

## Features

- Generates concise alt text for images.
- Configurable prompts, model, and token limits.
- Easy to integrate into Rails or Ruby applications.
- Fully configurable via initializer or programmatically.

---

## Installation

Add this line to your application's `Gemfile`:

```ruby
# If using the local path for development/testing
gem "alt_tag_gen", path: "/path/to/your/alt_tag_gen"

# OR if published to RubyGems
# gem "alt_tag_gen"
