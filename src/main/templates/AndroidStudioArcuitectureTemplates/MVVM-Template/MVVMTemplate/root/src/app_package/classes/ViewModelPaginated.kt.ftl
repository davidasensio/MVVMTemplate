package ${packageName}

import android.annotation.SuppressLint
import android.app.Application
import android.arch.lifecycle.MutableLiveData
import android.os.AsyncTask
import android.os.Bundle
import com.google.gson.Gson
import org.json.JSONObject

class ${className}ViewModelPaginated(application: Application) : BaseViewModelPaginated(application) {

    lateinit var title: String
    private var dataResource: MutableLiveData<Resource<Array<${className}>>>? = null
    private val dataArray = ArrayList<${className}>()

    override fun reload() {
        onPreparedForReload {
            dataArray.clear()
        }
    }

    override fun getNextPage(currentItemPosition: Int) {
        onPreparedForNextPage(currentItemPosition, dataArray.size) {
            load${className}()
        }
    }

    fun get${className}(): MutableLiveData<Resource<Array<${className}>>> {
        if (dataResource == null ||
                (dataResource as MutableLiveData<Resource<Array<${className}>>>).value?.status == Resource.Status.ERROR) {
            dataResource = MutableLiveData()
            load${className}()
        }
        return dataResource as MutableLiveData<Resource<Array<${className}>>>
    }

    override fun initData(data: Bundle) {
        title = data.getString(ExampleActivity.KEY_TITLE) ?: "No title"
    }

    @Suppress("UNCHECKED_CAST")
    @SuppressLint("StaticFieldLeak")
    fun load${className}() {

        ${className}APIInteractor(getApplication()).get${className}(page, object : APIInteractor.APIResponseDataCallback {
            override fun onResponse(success: Boolean, statusCode: Int, any: Any?, errorMessage: String?) {
                any?.let {
                    object : AsyncTask<Void, Void, Void>() {
                        override fun doInBackground(vararg params: Void?): Void? {

                            val data = getPaginatedData(any as JSONObject)
                            if (data != null) {
                                for (i in 0 until data.length()) {
                                    val ${classNameLowercase} = data.getJSONObject(i).toString()
                                    dataArray.add(Gson().fromJson(${classNameLowercase}, ${className}::class.java))
                                }
                            }
                            return null
                        }

                        override fun onPostExecute(result: Void?) {
                            dataResource?.value = Resource(statusCode, errorMessage, dataArray.toTypedArray())
                        }
                    }.execute()
                }
                return
            }
        })
    }

    fun add(${classNameLowercase}Text: String) {
        val ${classNameLowercase} = ${className}(99, ${classNameLowercase}Text, ${classNameLowercase}Text)
        ${className}APIInteractor(getApplication()).post${className}(${classNameLowercase}, object : APIInteractor.APIResponseDataCallback {
            override fun onResponse(success: Boolean, statusCode: Int, any: Any?, errorMessage: String?) {
                if (success) dataArray.add(any as ${className})
                dataResource?.value = Resource(statusCode, errorMessage, dataArray.toTypedArray())
            }
        })
    }

    fun delete(${classNameLowercase}: ${className}) {
        ${className}APIInteractor(getApplication()).delete${className}(${classNameLowercase}.id.toString(), object : APIInteractor.APIResponseSimpleCallback {
            override fun onResponse(success: Boolean, statusCode: Int, errorMessage: String?) {
                if (success) dataArray.remove(${classNameLowercase})
                dataResource?.value = Resource(statusCode, errorMessage, dataArray.toTypedArray())
            }
        })
    }
}
