STATE			:=California
SPACE			:= $() $()
STATE_NOSPACE		:= $(subst $(SPACE),_,$(STATE))
REPORT			:= Analysis_$(STATE_NOSPACE).html
OUTPUT			:= output
REPORT_PATH		:= $(OUTPUT)/$(REPORT)
R_FUNCTIONS		:= $(wildcard code/functions/*.R)
MOBILITY_DATA		:= data/raw_data/applemobilitytrends-2022-04-12.csv
SEQ_DATA		:= /blast-db/sars-cov-2-seq-data/2022-10-17_ncbi_sars-cov-2-sequences.fasta.gz
SEQ_SUMMARY		:= $(OUTPUT)/sort_countries.txt

all: $(REPORT_PATH)

$(REPORT_PATH): Analysis.Rmd references.bib $(R_FUNCTIONS) $(SEQ_SUMMARY) $(MOBILITY_DATA) run_analyze_covid_pipline.sh
	bash run_analyze_covid_pipeline.sh "$(STATE)" "$(MOBILITY_DATA)" "$(SEQ_SUMMARY)"

$ (SEQ_SUMMARY): code/process_sequences.sh $(SEQ_DATA)
	bash code/process_sequences.sh "$(SEQ_DATA)" > "$(SEQ_SUMMARY)"

clean:
	rm -fv output/*.html
	rm -fv Analysis.html
	rm -fv output/*summary.txt
	rm -fv output/*/*.csv
	rm -fv output/*/*.png

.PHONY: all clean