# frozen_string_literal: true

require "extract_i18n/version"

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

module ExtractI18n
  class << self
    attr_accessor :strip_path, :ignore_hash_keys, :ignore_functions, :ignorelist
  end

  self.strip_path = %r{^app/|\.rb|^lib/$}
  self.ignore_hash_keys = %w[class_name foreign_key join_table association_foreign_key key]
  self.ignore_functions = %w[where order group select sql]
  self.ignorelist = [
    '_',
    '::'
  ]
end

require 'extract_i18n/file_processor'
