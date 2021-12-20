class Api::V1::VisitsController < Api::V1::GraphitiController
  def index
    visits = VisitResource.all(params)
    respond_with(visits)
  end

  def show
    visit = VisitResource.find(params)
    respond_with(visit)
  end

  def create
    visit = VisitResource.build(params)

    if visit.save
      render jsonapi: visit, status: 201
    else
      render jsonapi_errors: visit
    end
  end

  def update
    visit = VisitResource.find(params)

    if visit.update_attributes
      render jsonapi: visit
    else
      render jsonapi_errors: visit
    end
  end

  def destroy
    visit = VisitResource.find(params)

    if visit.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: visit
    end
  end
end
