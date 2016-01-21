require 'cchp/save_filename/version'

module Cchp
  class SaveFilename
    class InvalidDateError < StandardError
    end
    attr_accessor :basename, :member_id, :file_type, :directory, :date

    def initialize(params={})
      @basename  = params.fetch(:basename)
      @member_id = params.fetch(:member_id)
      @directory = params.fetch(:directory, File.join('.', 'save'))
      @date      = params.fetch(:date, Date.today)
      @file_type = params.fetch(:file_type, '.pdf')
    end

    def print_date
      date.respond_to?(:to_str) ? Date.parse(date.to_str) : date
    rescue ArgumentError => ex
      raise InvalidDateError, [ex.message, date, %[Recommend `%Y%m%d' format']].join(' '), [__FILE__, __LINE__].join(':')
    end

    def filename
      [id, print_date.strftime('%Y%m%d'), basename].join('_') + file_type
    end

    def to_path
      File.join(directory, filename)
    end

    alias_method :to_s, :to_path

    def id
      member_id.gsub('*', '_')
    end
  end
end
