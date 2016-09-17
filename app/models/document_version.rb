# app/models/document_version.rb
class DocumentVersion < PaperTrail::Version

  self.table_name = :document_versions
  default_scope { where.not(event: 'create') } 
end

# Note the default_scope we added. 
# We don’t really care about create events since those don’t contain anything. 
# Let’s just exclude them.