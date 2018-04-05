package ${packageName}

import android.content.Context
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.http.*

class ${className}APIInteractor(context: Context) : BaseAPIInteractor<${className}>(context) {

    fun get${className}(callback: APIInteractor.APIResponseDataCallback) {
        APIInteractor.get${className}APIInteractor(context).get${className}().enqueue(getDefaultDataCallback(callback))
    }

    fun get${className}(pageNumber: Int, callback: APIInteractor.APIResponseDataCallback) {
        APIInteractor.get${className}APIInteractor(context).get${className}(pageNumber, Pagination.DEFAULT_PAGE_LIMIT)
                .enqueue(getDefaultDataCallback(callback))
    }

    fun post${className}(${classNameLowercase}: ${className}, callback: APIInteractor.APIResponseDataCallback) {
        APIInteractor.get${className}APIInteractor(context).post${className}(${classNameLowercase}).enqueue(getEntityDataCallback(callback))
    }

    fun delete${className}(${classNameLowercase}Id: String, callback: APIInteractor.APIResponseSimpleCallback) {
        APIInteractor.get${className}APIInteractor(context).delete${className}(${classNameLowercase}Id).enqueue(getDefaultSimpleCallback(callback))
    }

    interface Interface {

        @GET("${classNameLowercase}/")
        fun get${className}(): Call<ResponseBody>

        @GET("${classNameLowercase}/")
        fun get${className}(@Query(Pagination.PAGINATION_PAGE_FIELD) page: Int, @Query(Pagination.PAGINATION_LIMIT_FIELD) pageSize: Int = Pagination.DEFAULT_PAGE_LIMIT): Call<ResponseBody>

        @POST("${classNameLowercase}/")
        fun post${className}(@Body ${classNameLowercase}: ${className}): Call<${className}>

        @DELETE("${classNameLowercase}/{${classNameLowercase}_id}")
        fun delete${className}(@Path("${classNameLowercase}_id") ${classNameLowercase}Id: String): Call<ResponseBody>
    }
}