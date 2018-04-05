package ${packageName}

import com.google.gson.annotations.SerializedName
import java.io.Serializable

class ${className}(@SerializedName("id") val id: Int,
           @SerializedName("name") val name: String,
           @SerializedName("description") val description: String) : Serializable