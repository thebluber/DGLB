module EntriesHelper
  #The next page should be linked too. REASON: dictionary entry could be on 2 or even more pages...
  #I am not paid enough for preventing error triggered by non-existing 2. page!
  def to_scan_pages kennzahl
    page = kennzahl.split(":")[0].to_i #avoid error for kennzahl with 0 at the beginning
    [to_scan_pages_helper(page), to_scan_pages_helper(page + 1)]
  end
  private
  def to_scan_pages_helper page
    page = page.to_s
    if page.length < 4
      diff = 4 - page.length
      while diff > 0 do
        page = "0" + page
        diff -= 1
      end
    end
    page
  end
end
