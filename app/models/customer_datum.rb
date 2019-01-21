class CustomerDatum < ApplicationRecord
    belongs_to :cooperative

    filterrific(
        # default_filter_params: { sorted_by: 'created_at_desc' },
        available_filters: [
            :search_query,
        ]
    )

    scope :search_query, lambda {|query|
        return nil  if query.blank?

        terms = query.downcase.split(/\s+/)
        terms = terms.map { |e|
            (e.gsub('*', '%') + '%').gsub(/%+/, '%')
        }

        num_conditions = 13
        where(
            terms.map {
                or_clauses = [
                    "LOWER(customer_data.ra_company) LIKE ?",
                    "LOWER(customer_data.ra_firstname) LIKE ?",
                    "LOWER(customer_data.ra_lastname) LIKE ?",
                    "LOWER(customer_data.ra_street) LIKE ?",
                    "LOWER(customer_data.ra_zip) LIKE ?",
                    "LOWER(customer_data.ra_city) LIKE ?",
                    "LOWER(customer_data.ra_mail) LIKE ?",
                    "LOWER(customer_data.ls_firstname) LIKE ?",
                    "LOWER(customer_data.ls_lastname) LIKE ?",
                    "LOWER(customer_data.ls_street) LIKE ?",
                    "LOWER(customer_data.ls_zip) LIKE ?",
                    "LOWER(customer_data.ls_city) LIKE ?",
                    "LOWER(customer_data.provider) LIKE ?"
                ].join(' OR ')
                "(#{ or_clauses })"
            }.join(' AND '),
            *terms.map { |e| [e] * num_conditions }.flatten
        )
    }
end
