class FileCategory < ApplicationRecord
    has_many :fileclips
    belongs_to :parent, optional: true, class_name: "FileCategory"

    validate :parent_not_same, on: :update

    def path
        _path = self.name
        _current = self
        until _current.parent.nil? do
            _current = _current.parent
            _path = _current.name + '/' + _path
        end
        return _path
    end

    def self.paths_for_collection
        self.all.map{ |fc| [fc.path, fc.id] }.sort_by { |fc| fc[0] }
    end

    private
        def parent_not_same
            unless self.parent.nil?
                if self.parent_id == self.id
                    errors.add(:parent_id, 'sollte nicht die gleiche Kategorie sein.')
                end

                if self.id == self.parent.parent_id
                    errors.add(:parent_id, 'sollte kein Unterordner sein.')
                end
            end
        end
end
