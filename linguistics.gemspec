# -*- encoding: utf-8 -*-
# stub: linguistics 2.1.0.pre20150301101829 ruby lib

Gem::Specification.new do |s|
  s.name = "linguistics"
  s.version = "2.1.0.pre20150301101829"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michael Granger"]
  s.cert_chain = ["/Users/ged/.gem/ged-public_gem_cert.pem"]
  s.date = "2015-03-01"
  s.description = "Linguistics is a framework for building linguistic utilities for Ruby\nobjects in any language. It includes a generic language-independant\nfront end, a module for mapping language codes into language names, and\na module which contains various English-language utilities."
  s.email = ["ged@FaerieMUD.org"]
  s.extra_rdoc_files = ["History.rdoc", "Manifest.txt", "README.rdoc", "History.rdoc", "README.rdoc"]
  s.files = [".simplecov", "ChangeLog", "History.rdoc", "LICENSE", "Manifest.txt", "README.rdoc", "Rakefile", "examples/endocs.rb", "examples/generalize_sentence.rb", "examples/klingon.rb", "lib/linguistics.rb", "lib/linguistics/en.rb", "lib/linguistics/en/articles.rb", "lib/linguistics/en/conjugation.rb", "lib/linguistics/en/conjunctions.rb", "lib/linguistics/en/infinitives.rb", "lib/linguistics/en/linkparser.rb", "lib/linguistics/en/numbers.rb", "lib/linguistics/en/participles.rb", "lib/linguistics/en/pluralization.rb", "lib/linguistics/en/stemmer.rb", "lib/linguistics/en/titlecase.rb", "lib/linguistics/en/wordnet.rb", "lib/linguistics/inflector.rb", "lib/linguistics/iso639.rb", "lib/linguistics/languagebehavior.rb", "lib/linguistics/monkeypatches.rb", "spec/constants.rb", "spec/helpers.rb", "spec/linguistics/en/articles_spec.rb", "spec/linguistics/en/conjugation_spec.rb", "spec/linguistics/en/conjunctions_spec.rb", "spec/linguistics/en/infinitives_spec.rb", "spec/linguistics/en/linkparser_spec.rb", "spec/linguistics/en/numbers_spec.rb", "spec/linguistics/en/participles_spec.rb", "spec/linguistics/en/pluralization_spec.rb", "spec/linguistics/en/stemmer_spec.rb", "spec/linguistics/en/titlecase_spec.rb", "spec/linguistics/en/wordnet_spec.rb", "spec/linguistics/en_spec.rb", "spec/linguistics/inflector_spec.rb", "spec/linguistics/iso639_spec.rb", "spec/linguistics/monkeypatches_spec.rb", "spec/linguistics_spec.rb"]
  s.homepage = "http://deveiate.org/code/linguistics"
  s.licenses = ["BSD"]
  s.post_install_message = "This library also presents tie-ins for the 'linkparser' and\n'wordnet' libraries, which you can enable by installing the\ngems of the same name."
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.5"
  s.signing_key = "/Volumes/Keys/ged-private_gem_key.pem"
  s.summary = "Linguistics is a framework for building linguistic utilities for Ruby objects in any language"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<loggability>, ["~> 0.11"])
      s.add_development_dependency(%q<hoe-mercurial>, ["~> 1.4"])
      s.add_development_dependency(%q<hoe-deveiate>, ["~> 0.6"])
      s.add_development_dependency(%q<hoe-highline>, ["~> 0.2"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<linkparser>, ["~> 1.1"])
      s.add_development_dependency(%q<wordnet>, ["~> 1.0"])
      s.add_development_dependency(%q<wordnet-defaultdb>, ["~> 1.0"])
      s.add_development_dependency(%q<ruby-stemmer>, ["~> 0.9"])
      s.add_development_dependency(%q<rdoc-generator-fivefish>, ["~> 0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.13"])
    else
      s.add_dependency(%q<loggability>, ["~> 0.11"])
      s.add_dependency(%q<hoe-mercurial>, ["~> 1.4"])
      s.add_dependency(%q<hoe-deveiate>, ["~> 0.6"])
      s.add_dependency(%q<hoe-highline>, ["~> 0.2"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<linkparser>, ["~> 1.1"])
      s.add_dependency(%q<wordnet>, ["~> 1.0"])
      s.add_dependency(%q<wordnet-defaultdb>, ["~> 1.0"])
      s.add_dependency(%q<ruby-stemmer>, ["~> 0.9"])
      s.add_dependency(%q<rdoc-generator-fivefish>, ["~> 0"])
      s.add_dependency(%q<hoe>, ["~> 3.13"])
    end
  else
    s.add_dependency(%q<loggability>, ["~> 0.11"])
    s.add_dependency(%q<hoe-mercurial>, ["~> 1.4"])
    s.add_dependency(%q<hoe-deveiate>, ["~> 0.6"])
    s.add_dependency(%q<hoe-highline>, ["~> 0.2"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<linkparser>, ["~> 1.1"])
    s.add_dependency(%q<wordnet>, ["~> 1.0"])
    s.add_dependency(%q<wordnet-defaultdb>, ["~> 1.0"])
    s.add_dependency(%q<ruby-stemmer>, ["~> 0.9"])
    s.add_dependency(%q<rdoc-generator-fivefish>, ["~> 0"])
    s.add_dependency(%q<hoe>, ["~> 3.13"])
  end
end
