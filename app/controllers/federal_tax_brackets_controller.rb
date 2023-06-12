class FederalTaxBracketsController < ApplicationController
  before_action :set_federal_tax_bracket, only: %i[ show edit update destroy ]

  # GET /federal_tax_brackets or /federal_tax_brackets.json
  def index
    @federal_tax_brackets = FederalTaxBracket.order_by_range
  end

  # GET /federal_tax_brackets/1 or /federal_tax_brackets/1.json
  def show
  end

  # GET /federal_tax_brackets/new
  def new
    @federal_tax_bracket = FederalTaxBracket.new
  end

  # GET /federal_tax_brackets/1/edit
  def edit
  end

  # POST /federal_tax_brackets or /federal_tax_brackets.json
  def create
    @federal_tax_bracket = FederalTaxBracket.new(federal_tax_bracket_params)
    @federal_tax_bracket.update_rate(rate: params[:rate])

    respond_to do |format|
      if @federal_tax_bracket.save
        format.html { redirect_to federal_tax_bracket_url(@federal_tax_bracket), notice: "Federal tax bracket was successfully created." }
        format.json { render :show, status: :created, location: @federal_tax_bracket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @federal_tax_bracket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /federal_tax_brackets/1 or /federal_tax_brackets/1.json
  def update
    respond_to do |format|
      if @federal_tax_bracket.update(federal_tax_bracket_params)
        format.html { redirect_to federal_tax_bracket_url(@federal_tax_bracket), notice: "Federal tax bracket was successfully updated." }
        # format.json { render :show, status: :ok, location: @federal_tax_bracket }
        format.turbo_stream { render turbo_stream: turbo_stream.update(@federal_tax_bracket) }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @federal_tax_bracket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /federal_tax_brackets/1 or /federal_tax_brackets/1.json
  def destroy
    @federal_tax_bracket.destroy

    respond_to do |format|
      format.html { redirect_to federal_tax_brackets_url, notice: "Federal tax bracket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_federal_tax_bracket
      @federal_tax_bracket = FederalTaxBracket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def federal_tax_bracket_params
      params.require(:federal_tax_bracket).permit(:tier, :bottom_range, :top_range, :rate, :cumulative)
    end
end
