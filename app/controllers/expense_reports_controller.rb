class ExpenseReportsController < ApplicationController
  before_action :set_expense_report, only: %i[ show edit update destroy ]

  # GET /expense_reports or /expense_reports.json
  def index
    if params[:query].present?
      # This one uses the search method defined in the ExpenseReport controller
      @expense_reports = ExpenseReport.search_reports(params[:query])


      # This search uses the multisearch functionality which searches through the User and ExpenseReport models (see the results in the console)
      results = PgSearch.multisearch(params[:query])
      puts "***********************************"
      puts "We got #{results.length} results!"
      results.each do |result|
        puts "EACH RESULT"
        puts result.searchable
      end
    else
      @expense_reports = ExpenseReport.all
    # @expense_reports = policy_scope(ExpenseReport)
    end
  end

  # GET /expense_reports/1 or /expense_reports/1.json
  def show
    authorize @expense_report
  end

  # GET /expense_reports/new
  def new
    @expense_report = ExpenseReport.new
    authorize @expense_report
  end

  # GET /expense_reports/1/edit
  def edit
    authorize @expense_report
  end

  # POST /expense_reports or /expense_reports.json
  def create
    @expense_report = ExpenseReport.new(expense_report_params)
    authorize @expense_report

    respond_to do |format|
      if @expense_report.save
        format.html { redirect_to @expense_report, notice: "Expense report was successfully created." }
        format.json { render :show, status: :created, location: @expense_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_reports/1 or /expense_reports/1.json
  def update
    respond_to do |format|
      if @expense_report.update(expense_report_params)
        authorize @expense_report
        format.html { redirect_to @expense_report, notice: "Expense report was successfully updated." }
        format.json { render :show, status: :ok, location: @expense_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    @expense_report = ExpenseReport.find(params[:expense_report_id])
    authorize @expense_report
    @expense_report[:approved] = true
    @expense_report.save
    respond_to do |format|
      format.html { redirect_to @expense_report, notice: "Expense report was approved!!!!!" }
    end
  end

  # DELETE /expense_reports/1 or /expense_reports/1.json
  def destroy
    @expense_report.destroy
    respond_to do |format|
      format.html { redirect_to expense_reports_url, notice: "Expense report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_report
      @expense_report = ExpenseReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_report_params
      params.require(:expense_report).permit(:title, :date, :items, :approved)
    end
end
